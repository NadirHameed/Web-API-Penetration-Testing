# POC-02 – User Enumeration / IDOR

**Category:** BOLA (OWASP API1:2023)
**Endpoint:** `GET /api/users/{id}`
**Tool:** Burp Intruder

## Steps
1. Capture `GET /api/users/2` in Proxy history → **Send to Intruder**.
2. Highlight `2` → **Add §**: `GET /api/users/§2§`.
3. Payloads → **Numbers**: from 1 to 15, step 1.
4. Resource pool: max 1–2 concurrent requests.
5. Start attack; sort by **Status** and **Length**.

## Observation
- Valid IDs return `200` with user data (email, first/last name, avatar).
- Non-existent IDs return `404 {}`.
- IDs are sequential and predictable.

## Evidence
`![Intruder results](screenshots/poc02-intruder.png)`

## Impact
Predictable IDs allow bulk harvesting of user data. In a real app with private data this would be a High-severity BOLA.

## Remediation
Enforce object-level authorization, use non-guessable identifiers (UUIDs), limit returned data.

**Severity:** Low (CVSS 4.3) in this lab context
