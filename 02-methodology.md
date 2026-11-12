# Methodology

## Phase 1 – Recon & Mapping
1. Import API docs/endpoints into a Postman collection.
2. Route Postman through Burp (proxy `127.0.0.1:8080`) so every request lands in **Proxy → HTTP history**.
3. Review responses for headers, versions, error formats.

## Phase 2 – Authentication
- Login/register with valid, invalid, empty, malformed bodies.
- Check error-message differences (user enumeration).
- Inspect the returned token (format, entropy, JWT or opaque).
- Test token reuse, absence, tampering.

## Phase 3 – Authorization
- BOLA/IDOR: iterate `/api/users/{id}`.
- BFLA: try PUT/PATCH/DELETE without authentication.

## Phase 4 – Input Validation
- Special characters, long strings, type confusion, JSON/XML manipulation, SQLi/XSS probes (safe payloads).

## Phase 5 – Business Logic / Mass Assignment
- Add extra fields (`role`, `isAdmin`, `id`) to POST/PUT bodies.
- HTTP method override and verb tampering.

## Phase 6 – Rate Limiting
- Burp Intruder with low thread count; observe 429 responses.

## Phase 7 – Misconfiguration
- Security headers, CORS, TLS, verbose errors, HTTP methods (OPTIONS).

## Phase 8 – Reporting
- CVSS score, impact, evidence, remediation, retest.
