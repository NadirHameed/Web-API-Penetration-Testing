# Scope & Rules of Engagement

| Item | Detail |
|---|---|
| Target | https://reqres.in (public demo REST API) |
| Type | Black-box API & web assessment |
| Authorization | Public sandbox intended for testing |
| In scope | `/api/*` endpoints listed in README |
| Out of scope | DoS/stress testing, attacks on hosting infrastructure, other domains |
| Tools | Burp Suite, Postman, OWASP ZAP, curl |
| Standards | OWASP Top 10, OWASP API Security Top 10 (2023), CVSS v3.1 |

## Rules
- Keep request volume low; no denial-of-service.
- Use only dummy data.
- Record every request/response as evidence.
- Note: ReqRes is a mock API; many "vulnerabilities" are by-design behaviours. They are documented here to demonstrate methodology and reporting.
