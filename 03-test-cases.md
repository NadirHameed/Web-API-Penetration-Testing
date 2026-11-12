# Test Case Matrix

| ID | Category | OWASP API 2023 | Test | Result |
|---|---|---|---|---|
| TC-01 | Auth | API2 | Login with valid creds returns token | ☐ |
| TC-02 | Auth | API2 | Login missing password → error handling | ☐ |
| TC-03 | Auth | API2 | Error message differences (enumeration) | ☐ |
| TC-04 | Auth | API2 | Token format/entropy analysis | ☐ |
| TC-05 | Authz | API1 | Enumerate `/users/{id}` sequentially | ☐ |
| TC-06 | Authz | API5 | PUT/PATCH/DELETE without token | ☐ |
| TC-07 | Property | API3 | Mass assignment on POST /users | ☐ |
| TC-08 | Input | API8 | SQLi/XSS payloads in `name`/`job` | ☐ |
| TC-09 | Input | API8 | Oversized body / wrong content-type | ☐ |
| TC-10 | Resource | API4 | Rate limiting with Intruder | ☐ |
| TC-11 | Config | API8 | Security headers review | ☐ |
| TC-12 | Config | API8 | CORS policy (Origin reflection) | ☐ |
| TC-13 | Config | API8 | Verbose errors / stack traces | ☐ |
| TC-14 | Inventory | API9 | Undocumented/old endpoints | ☐ |

Mark ☐ → ✅ (pass) / ❌ (finding) after testing.
