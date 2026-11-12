# POC-06 – Security Headers & CORS

**Category:** Security Misconfiguration (API8:2023)
**Tool:** Burp Repeater

## Headers check
```http
GET /api/users/2 HTTP/2
Host: reqres.in
```
| Header | Expected |
|---|---|
| Strict-Transport-Security | present |
| X-Content-Type-Options | nosniff |
| X-Frame-Options / CSP frame-ancestors | present |
| Content-Security-Policy | present |
| Cache-Control | no-store on sensitive data |
| Server / X-Powered-By | no version disclosure |

## CORS check
```http
GET /api/users/2 HTTP/2
Host: reqres.in
Origin: https://evil.example
```
Check `Access-Control-Allow-Origin`: a reflected origin, or `*` with credentials, is an issue.

## OPTIONS check
```http
OPTIONS /api/users HTTP/2
Host: reqres.in
Origin: https://evil.example
Access-Control-Request-Method: DELETE
```

## Evidence
`![Headers](screenshots/poc06-headers.png)`

## Remediation
Add missing headers, restrict CORS to trusted origins, remove version banners.
