-- OAV Frezorpur demonstration production schema proposal.
-- Review and adapt with the school's authorised technical/admin team before use.
-- Apply this schema only to a dedicated project. No student personal-data tables are included.
create extension if not exists pgcrypto;

create table if not exists public.site_pages (
  id uuid primary key default gen_random_uuid(),
  slug text not null unique check (slug ~ '^[a-z0-9-]+$'),
  title text not null,
  content jsonb not null default '{}'::jsonb,
  language text not null default 'en' check(language in ('en','or')),
  status text not null default 'draft' check(status in ('draft','published')),
  updated_at timestamptz not null default now(),
  updated_by uuid references auth.users(id)
);
create table if not exists public.notices (
  id uuid primary key default gen_random_uuid(),
  title text not null check (length(title) between 1 and 180),
  summary text not null default '',
  category text not null default 'General',
  attachment_path text,
  publish_date date,
  is_pinned boolean not null default false,
  status text not null default 'draft' check(status in ('draft','published')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  created_by uuid references auth.users(id)
);
create table if not exists public.faculty (
  id uuid primary key default gen_random_uuid(),
  display_name text not null,
  designation text,
  subject text,
  bio text,
  photo_path text,
  sort_order integer not null default 0,
  is_published boolean not null default false,
  updated_at timestamptz not null default now(),
  updated_by uuid references auth.users(id)
);
create table if not exists public.gallery_items (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  caption text not null default '',
  album text not null default 'School events',
  image_path text not null,
  captured_on date,
  is_published boolean not null default false,
  created_at timestamptz not null default now(),
  created_by uuid references auth.users(id)
);
create table if not exists public.documents (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  category text not null,
  file_path text not null,
  document_date date,
  is_public boolean not null default true,
  created_at timestamptz not null default now(),
  created_by uuid references auth.users(id)
);
create table if not exists public.admin_activity (
  id bigint generated always as identity primary key,
  actor uuid references auth.users(id),
  action text not null,
  entity_type text not null,
  entity_id text,
  created_at timestamptz not null default now()
);
-- Use trusted Supabase Auth user app_metadata.role='school_admin', managed by a trusted server/admin.
create or replace function public.is_school_admin()
returns boolean language sql stable security definer set search_path=public
as $$ select coalesce((auth.jwt()->'app_metadata'->>'role') = 'school_admin', false) $$;
revoke all on function public.is_school_admin() from public;
grant execute on function public.is_school_admin() to anon, authenticated;

alter table public.site_pages enable row level security;
alter table public.notices enable row level security;
alter table public.faculty enable row level security;
alter table public.gallery_items enable row level security;
alter table public.documents enable row level security;
alter table public.admin_activity enable row level security;
-- Public visitors can read only published/public material.
drop policy if exists "public reads published pages" on public.site_pages;
create policy "public reads published pages" on public.site_pages for select to anon, authenticated using (status='published');
drop policy if exists "public reads published notices" on public.notices;
create policy "public reads published notices" on public.notices for select to anon, authenticated using (status='published');
drop policy if exists "public reads published faculty" on public.faculty;
create policy "public reads published faculty" on public.faculty for select to anon, authenticated using (is_published);
drop policy if exists "public reads published gallery" on public.gallery_items;
create policy "public reads published gallery" on public.gallery_items for select to anon, authenticated using (is_published);
drop policy if exists "public reads public documents" on public.documents;
create policy "public reads public documents" on public.documents for select to anon, authenticated using (is_public);
-- Authorised administrators can manage content. This permission is server-enforced by signed app_metadata.
create policy "admins manage pages" on public.site_pages for all to authenticated using (public.is_school_admin()) with check (public.is_school_admin());
create policy "admins manage notices" on public.notices for all to authenticated using (public.is_school_admin()) with check (public.is_school_admin());
create policy "admins manage faculty" on public.faculty for all to authenticated using (public.is_school_admin()) with check (public.is_school_admin());
create policy "admins manage gallery" on public.gallery_items for all to authenticated using (public.is_school_admin()) with check (public.is_school_admin());
create policy "admins manage documents" on public.documents for all to authenticated using (public.is_school_admin()) with check (public.is_school_admin());
create policy "admins read activity log" on public.admin_activity for select to authenticated using (public.is_school_admin());
create policy "admins insert activity log" on public.admin_activity for insert to authenticated with check (public.is_school_admin());
-- Add storage buckets only after review. For public-download bucket objects, restrict writes to admins;
-- do not store private school/student records in a public bucket. Use a private bucket for sensitive files.
