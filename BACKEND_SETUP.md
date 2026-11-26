# Backend setup guide (production proposal)

This project is a static GitHub Pages demonstration. Its admin preview uses browser `localStorage`; it does not have real sign-in, cloud saving, upload, backup, access control or cross-device sync.

## Before creating a production project

1. Obtain written approval from OAV Frezorpur/OAVS for the website, domain, brand assets, administrators and published data.
2. Confirm the institution's IT/hosting requirements. GitHub Pages can host static frontend files; it cannot run a private server API. Supabase can provide the database, authentication and storage layer.
3. Assign an authorised adult institutional owner to manage the Supabase project, recovery email, billing and administrator accounts.
4. Review the privacy notice, data retention, access roles and backup approach. This site should remain limited to public school information and avoid student accounts or student records.

## Supabase project

1. Create a dedicated Supabase project owned by the institution.
2. In SQL Editor, review `supabase/schema.sql`, adapt it, then apply to a non-production project first.
3. Enable email/password authentication or an institution-approved identity provider. Disable public sign-up; invite named school administrators only. Set the trusted `app_metadata.role` from a secure server/admin process. Never let the browser set its own role.
4. Keep RLS enabled. Test every anon and authenticated query as an ordinary user and as an administrator. The public website should see only published records.
5. Configure Storage buckets separately. Public documents/photos may use a public read policy only after approval. All writes must require an authenticated admin role. Sensitive files need private buckets and signed URLs.
6. Configure password recovery, MFA where available, verified email, session expiry, least privilege, and alerts for account changes.
7. Establish automatic database backups and periodically test restoring to a separate project.

## Frontend connection

1. Add only the project URL and publishable/anon key to `assets/js/config.js` after a production integration is written and reviewed. Publishable keys are intended for browser use only when RLS is correct.
2. Never place a service-role key, database password, JWT signing secret or private API key in this repository or GitHub Pages.
3. Replace the demo-only localStorage calls in `assets/js/admin.js` and `assets/js/site.js` with Supabase Auth and database/storage operations; implement server-enforced permissions and errors.
4. Add validation, output escaping, file MIME/size checks, rate limits, audit logging and safe content rendering. Do not inject untrusted HTML.
5. Test a separate staging build and review authentication, RLS, document access, cross-site scripting, upload restrictions, password recovery and backups before official publication.

## GitHub Pages

A static build can use GitHub Pages for a non-sensitive approved public site. Keep relative paths so it works from a repository subpath. Use HTTPS and prevent demo/staging sites from indexing. Point a custom domain only after the institution authorises it and controls DNS. Do not deploy this demonstration as an official school site without approval and completed production review.
