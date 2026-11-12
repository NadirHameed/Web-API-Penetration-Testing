# POC-04 – Input Validation & Injection Probes

**Category:** API8:2023 / OWASP A03 Injection
**Endpoint:** `POST /api/users`, `POST /api/register`
**Tool:** Burp Repeater + Intruder (Sniper)

## Payload groups (safe, non-destructive)
- SQLi probes: `'`, `' OR '1'='1`, `1;--`
- XSS probes: `<script>alert(1)</script>`, `"><img src=x onerror=alert(1)>`
- Template injection: `{{7*7}}`, `${7*7}`
- Long string: 5,000 × `A`
- Type confusion: `{"name":123}`, `{"name":["a"]}`, `{"name":null}`

## Steps
1. Send `POST /api/users` to Intruder, mark the `name` value.
2. Load `burp/intruder-payloads.txt`.
3. Compare response status/length/time against baseline.
4. Check whether payloads are reflected unencoded.

```http
POST /api/users HTTP/2
Host: reqres.in
Content-Type: application/json

{"name":"<script>alert(1)</script>","job":"' OR '1'='1"}
```

## Observation (document yours)
- Is the payload reflected? (JSON responses are typically not exploitable as XSS unless rendered into HTML.)
- Any stack traces or DB errors?

## Evidence
`![Injection test](screenshots/poc04-injection.png)`

## Remediation
Server-side schema validation, parameterized queries, output encoding, strict `Content-Type` checks.
