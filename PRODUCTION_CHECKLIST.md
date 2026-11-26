# Production deployment checklist

## Institutional approval and verified content
- [ ] Written approval to create and publish the site; identify the domain owner and content approver.
- [ ] Confirm school name/spelling, Odia name, establishment year, UDISE code, address pin, current class range and current CBSE affiliation details from authoritative records.
- [ ] Confirm principal, staff, official contact details, facilities, streams, disclosure documents and school-approved copy.
- [ ] Obtain written permission for official OAVS/school marks, logo, campus photographs and student/staff images; obtain appropriate consent.
- [ ] Review all notices and PDFs for accuracy, currency, accessibility and personal information.

## Engineering and security
- [ ] Replace all demo/localStorage code with reviewed Supabase integration.
- [ ] Configure Auth with invite-only accounts and secure recovery; no public registration.
- [ ] Verify Row Level Security as anon, regular authenticated user and school_admin; test denied operations.
- [ ] Restrict Storage uploads by role, content type and size; keep private content in private buckets.
- [ ] Check XSS, CSRF where relevant, input validation, file upload handling, API rate limits, dependency and secret scanning.
- [ ] Confirm HTTPS, security headers through a suitable host/CDN, private key handling and account MFA.
- [ ] Configure audit logs, retention, automated backups and a successful restore test.
- [ ] Confirm privacy policy, cookie/external service notice and accessibility contact.

## Release checks
- [ ] Test all 24 public pages plus custom 404 on Android and desktop.
- [ ] Test all links, dropdowns, mobile menu, language controls, forms, PDF links and images.
- [ ] Review English and Odia text with fluent institutional reviewers.
- [ ] Test keyboard navigation, visible focus, screen-reader labels, contrast, reduced motion and PDF accessibility.
- [ ] Check performance on a low-bandwidth mobile connection; compress and locally host approved images.
- [ ] Keep `noindex` and `robots.txt` blocking until authorisation and production readiness; then intentionally update SEO settings.
- [ ] Verify analytics are approved and privacy-compliant before enabling.
- [ ] Publish to the school-authorised domain and verify institutional contact/ownership details.
