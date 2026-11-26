# Quality assurance report

## Completed checks

- Parsed the public HTML page files and checked relative `href`/`src` references: **27 HTML files checked; no missing local references found**.
- Ran `node --check` on `assets/js/site.js`, `assets/js/admin.js` and `assets/js/config.js`: all parsed without syntax errors before the final Odia translation-field edit. Re-run after extracting the ZIP as part of deployment review.
- Reviewed the page inventory, demo-only warnings, non-indexing controls, local asset references and production setup docs.
- The admin workflows are implemented for local demonstration: notice create/edit/delete/publish/unpublish/pin, page introduction draft edits, faculty CRUD, gallery CRUD, document CRUD and JSON export/import/reset.

## Not completed / limits

- Interactive desktop/mobile browser automation could not run: the installed Chromium launcher referenced a missing executable. No browser screenshot or device-level visual check is claimed.
- Notice/gallery/document CRUD were not exercised in a live browser during this build; local link and script syntax checks are not a substitute for that.
- No Supabase project exists in this demo. Authentication, password recovery, server-side role checks, remote storage, backups and audit persistence are not implemented or security-tested.
- No current UDISE, establishment year, school-approved staff/facility information, current affiliation validity or official contact data was independently confirmed.
- Odia content is not fully translated. The switcher shows the limited Odia interface labels and a clear translation-pending message; the CMS has a field for school-reviewed translation.
- No formal WCAG, GIGW, CBSE, government or security certification is claimed.
