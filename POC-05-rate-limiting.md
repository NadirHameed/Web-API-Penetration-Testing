# POC-05 – Rate Limiting

**Category:** Unrestricted Resource Consumption (API4:2023)
**Endpoint:** `POST /api/login`
**Tool:** Burp Intruder

## Steps
1. Send login request to Intruder, attack type **Sniper**.
2. Payload: **Null payloads**, limited to ~100 requests.
3. Resource pool: 3–5 concurrent threads.
4. Watch for `429 Too Many Requests` or `Retry-After`.

## Observation
Record how many requests pass before throttling (if any) and any `X-RateLimit-*` headers.

## Evidence
`![Intruder rate test](screenshots/poc05-ratelimit.png)`

## Impact
Absent throttling enables brute force / credential stuffing.

## Remediation
Per-IP and per-account limits, progressive delays, CAPTCHA, alerting.

> Do not perform stress/DoS testing.
