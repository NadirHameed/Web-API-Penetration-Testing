#!/usr/bin/env bash
# Quick baseline checks against the ReqRes lab (low volume). Lab use only.
BASE="https://reqres.in/api"
PROXY="${PROXY:-}"   # e.g. PROXY="-x http://127.0.0.1:8080 -k" to send via Burp

echo "[1] GET users";          curl -s $PROXY "$BASE/users?page=2" | head -c 300; echo
echo "[2] Login valid";        curl -s $PROXY -X POST "$BASE/login" -H 'Content-Type: application/json' -d '{"email":"eve.holt@reqres.in","password":"cityslicka"}'; echo
echo "[3] Login missing pass"; curl -s $PROXY -X POST "$BASE/login" -H 'Content-Type: application/json' -d '{"email":"eve.holt@reqres.in"}'; echo
echo "[4] Unauth DELETE";      curl -s $PROXY -o /dev/null -w "%{http_code}\n" -X DELETE "$BASE/users/2"
echo "[5] Mass assignment";    curl -s $PROXY -X POST "$BASE/users" -H 'Content-Type: application/json' -d '{"name":"x","job":"y","role":"admin"}'; echo
echo "[6] Headers";            curl -sI $PROXY "$BASE/users/2"
