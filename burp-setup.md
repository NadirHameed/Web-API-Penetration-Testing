# Burp Suite Setup for API Testing

1. **Proxy listener:** Proxy → Proxy settings → `127.0.0.1:8080`.
2. **CA certificate:** browse to `http://burpsuite`, install the CA cert.
3. **Postman → Burp:** Postman Settings → Proxy → Custom proxy `127.0.0.1:8080`; disable SSL verification (lab only).
4. **Scope:** Target → Scope → add `https://reqres.in`; enable dropping out-of-scope requests.
5. **Useful extensions (BApp Store):** Autorize, JWT Editor, Logger++, Param Miner, Content Type Converter.
6. **Workflow:** Proxy history → Send to Repeater / Intruder; save evidence with screenshots.
7. Keep `.burp` project files out of the repo if they contain sensitive data.
