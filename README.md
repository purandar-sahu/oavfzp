# Odisha Adarsha Vidyalaya, Frezorpur — Website Demonstration

A multi-page, mobile-friendly presentation site for review by the school. Built with HTML, CSS and vanilla JavaScript. The public pages and admin preview run as static files and can be hosted on GitHub Pages.

> **Unofficial Website Demonstration — For Presentation Purposes Only.** This project is not commissioned, approved or operated by OAVS, the Government of Odisha or the school. Do not publish it as an official website without written approval.

## What is included

- Home and 24 information pages plus a custom 404: About, History, Vision & Mission, Principal's Message, Administration, Teaching Staff, Academics, Admission, Academic Calendar, Examination Schedule, Timetable, Notices, Infrastructure, Library, Laboratories, Sports & Activities, Achievements, Photo Gallery, Downloads, Mandatory Public Disclosure, CBSE Information, Contact, Privacy Policy and Accessibility Statement.
- Responsive academic visual system, accessible navigation, responsive dropdowns, reduced-motion support, English/Odia display toggle (Odia UI labels only; institutional text needs verified translation).
- Local demonstration CMS for pages, notices, faculty, gallery and documents. Its edits use browser local storage and remain on that device.
- Supabase/PostgreSQL schema proposal with RLS policies; setup, admin, and launch/security guidance.
- `robots.txt` blocks crawling and page metadata includes `noindex,nofollow` until the site is approved.

## Verified and pending details

Public records identify OAV Frezorpur in Paikmal, Bargarh; a CBSE academic circular lists affiliation number 1520036; OAVS 2026–27 material lists classes VI–XII. A 2025 XI admission list lists Science. Confirm current affiliation validity and all operational details with the school/OAVS before publication. UDISE code, establishment year, current principal, staff names, facilities, contact details and school-approved photographs are deliberately not invented.

The hero is a locally drawn illustrative placeholder, not a photo of the school. Replace it with an authorised photograph. See `docs/VERIFICATION_NOTES.md` for research links and limitations.

## Preview locally

Open `index.html` in a browser or publish the repository to GitHub Pages. No package install, build step, or desktop-only tool is required. Some browsers restrict local `file://` map embeds; the rest of the site is static. On GitHub Pages, use the repo root as the publishing source. The ZIP has `index.html` at its root.

## GitHub Pages deployment

1. Create a new GitHub repository and upload the ZIP contents (not the ZIP itself), keeping the folder structure.
2. Confirm `index.html` sits at the repository root beside `about.html`, `admin.html`, `assets/`, and `docs/`.
3. In repository **Settings → Pages**, choose deploy from branch, select `main` and `/ (root)`, then save.
4. Open the Pages URL and check `index.html`, mobile navigation and `admin.html`.
5. Keep it marked as a demo and non-indexed. Do not attach an official school domain until written approval, current information verification and production/security review are complete.

## Sources consulted

- OAVS public ERP directory: `https://erp.oav.edu.in/public/` (lists OAV Frezorpur, Paikmal, Baragada; individual institution link and details need confirmation).
- CBSE Academic circular PDF: `https://cbseacademic.nic.in/web_material/Circulars/2023/69_Circular_2023_BhubaneswarBatch2.pdf` (lists the school with CBSE number 1520036; current validity not established by that list).
- District-hosted OAVS XI admission document: `https://subarnapur.odisha.gov.in/sites/default/files/2025-06/Letter%202440%20-%20OAVS%20-%20Admission%20in%20Class%20XI.pdf` (lists OAV Frezorpur, Paikmal, Science for 2025–26).
- OAVS-hosted transfer list: `https://oav.edu.in/uploads/OAVS/NOTIFICATION_OAVS_20250624110628.pdf` (school listed as OAV Frezorpur; individual transfer entries are not a current staff directory).
- CBSE SARAS directory: `https://saras.cbse.gov.in/SARAS/AffiliatedList/ListOfSchdirReportNew` (use to confirm current affiliation before launch).
- UDISE+: `https://udiseplus.gov.in/` (use to verify UDISE code and current school records).

## Production backend

Read `BACKEND_SETUP.md` and `schema.sql`. Supabase is not configured in this demonstration. Do not add service-role keys, passwords or secrets to frontend files or a public GitHub repository. The schema is a proposal and needs an administrator/security review before use.

## Quality checks performed

See `QA_REPORT.md` for the project-level checks and known limits. Browser local-storage behavior is a preview only; it does not implement server authentication, secure multi-admin roles or backups.
