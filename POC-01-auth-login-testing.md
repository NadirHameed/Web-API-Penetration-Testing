# POC-01 – Authentication & Login Testing

**Category:** Broken Authentication (OWASP API2:2023)
**Endpoint:** `POST /api/login`
**Tool:** Burp Suite (Proxy, Repeater, Sequencer)

## Objective
Evaluate login behaviour, error handling and token issuance.

## Steps
1. Configure Postman/browser to use Burp proxy (`127.0.0.1:8080`).
2. Send a valid login and capture it in **Proxy → HTTP history**.
3. Right-click → **Send to Repeater**.

### Request A – Valid credentials
```http
POST /api/login HTTP/2
Host: reqres.in
Content-Type: application/json

{"email":"eve.holt@reqres.in","password":"cityslicka"}
```
Expected: `200 OK` with `{"token":"..."}`.

### Request B – Missing password
```http
POST /api/login HTTP/2
Host: reqres.in
Content-Type: application/json

{"email":"eve.holt@reqres.in"}
```
Expected: `400` with `{"error":"Missing password"}`.

### Request C – Unknown user
```json
{"email":"nouser@test.com","password":"x"}
```
Expected: `400` with `{"error":"user not found"}`.

## Observation
- Different messages for "Missing password" vs "user not found" allow user enumeration.
- Analyse the token in **Burp Decoder / Sequencer** (JWT or opaque, length, predictability).

## Evidence
`![Login request in Repeater](screenshots/poc01-repeater.png)`

## Impact
Attacker can confirm which emails exist, aiding credential stuffing.

## Remediation
Return generic errors ("Invalid credentials"), add rate limiting/lockout, use high-entropy short-lived tokens.

**Severity:** Low (CVSS 3.7)
