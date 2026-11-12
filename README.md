# Web & API Penetration Testing – ReqRes Lab

![Type](https://img.shields.io/badge/Type-VAPT-blue) ![Target](https://img.shields.io/badge/Target-reqres.in-green) ![Tools](https://img.shields.io/badge/Tools-Burp%20Suite%20%7C%20Postman-orange) ![Standard](https://img.shields.io/badge/Standard-OWASP%20API%20Top%2010-red)

A structured security assessment of web applications and APIs, covering vulnerability discovery, exploitation validation, and actionable remediation guidance. This repository documents a hands-on lab against the **ReqRes** public demo API (`https://reqres.in`), a sandbox built for testing and learning.

> ⚠️ **Scope & Ethics:** ReqRes is a public mock API intended for testing. All testing here is performed for learning/portfolio purposes only. Never run these techniques against systems you don't own or lack written authorization to test.

## About the Author
VAPT Analyst with experience across bug bounty (HackerOne), banking (MCB Bank), and healthcare technology (CareCloud). Focus: web application and API penetration testing, JWT/auth testing, and clear, actionable reporting.

## Key Features
- Manual and automated testing for web applications and APIs
- Validation of findings with safe proof-of-concept evidence
- Coverage for OWASP Top 10 and common API weaknesses
- Prioritized findings with clear remediation and retesting guidance

## Technologies
`Burp Suite` · `Postman` · `OWASP ZAP` · `OWASP Top 10` · `OWASP API Security Top 10` · `CVSS v3.1` · `VAPT Reporting`

## Repository Structure
```
.
├── README.md
├── docs/
│   ├── 01-scope-and-rules.md
│   ├── 02-methodology.md
│   ├── 03-test-cases.md
│   └── 04-findings-summary.md
├── pocs/
│   ├── POC-01-auth-login-testing.md
│   ├── POC-02-user-enumeration-idor.md
│   ├── POC-03-mass-assignment-method-tampering.md
│   ├── POC-04-input-validation-injection.md
│   ├── POC-05-rate-limiting.md
│   └── POC-06-security-headers-cors.md
├── burp/
│   ├── burp-setup.md
│   └── intruder-payloads.txt
├── scripts/
│   └── reqres_checks.sh
└── reports/
    └── VAPT_Report_Template.md
```
> Place your Burp screenshots in `pocs/screenshots/` and reference them in each POC file.

## Methodology (Summary)
1. Reconnaissance & API mapping (Postman collection → Burp proxy)
2. Authentication & session testing
3. Authorization testing (BOLA/IDOR, BFLA)
4. Input validation & injection
5. Business logic & mass assignment
6. Rate limiting & resource consumption
7. Security misconfiguration (headers, CORS, error handling)
8. Reporting with CVSS scoring and retest

## Endpoints Under Test
| Method | Endpoint | Purpose |
|---|---|---|
| GET | `/api/users?page=2` | List users |
| GET | `/api/users/{id}` | Single user |
| POST | `/api/users` | Create user |
| PUT/PATCH | `/api/users/{id}` | Update user |
| DELETE | `/api/users/{id}` | Delete user |
| POST | `/api/register` | Register |
| POST | `/api/login` | Login |
| GET | `/api/unknown` | Resource list |

## Findings Overview
See [`docs/04-findings-summary.md`](docs/04-findings-summary.md).

## Disclaimer
For educational use only. The author is not responsible for misuse.
