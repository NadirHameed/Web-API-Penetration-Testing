# Findings Summary

> Fill in after running the POCs. Below is a typical set of observations for a mock API like ReqRes; **verify each in your own testing** before keeping it.

| ID | Title | Severity | CVSS | OWASP API | Status |
|---|---|---|---|---|---|
| F-01 | Missing authentication on write operations (POST/PUT/PATCH/DELETE) | Medium | 5.3 | API2 / API5 | Open |
| F-02 | Sequential user IDs enable enumeration | Low | 4.3 | API1 | Open |
| F-03 | Mass assignment: arbitrary properties accepted | Low | 4.3 | API3 | Open |
| F-04 | Differing login error messages | Low | 3.7 | API2 | Open |
| F-05 | Missing/weak rate limiting | Low | 3.7 | API4 | Open |
| F-06 | Missing security headers (CSP, X-Frame-Options, etc.) | Info/Low | 3.1 | API8 | Open |
| F-07 | Permissive CORS | Low | 3.5 | API8 | Open |

## Severity Scale (CVSS v3.1)
Critical 9.0–10 · High 7.0–8.9 · Medium 4.0–6.9 · Low 0.1–3.9 · Info 0
