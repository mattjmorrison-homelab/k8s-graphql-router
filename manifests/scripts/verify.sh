#!/bin/sh
set -eu

apk add --no-cache curl >/dev/null

URL="https://graphql.morrisons.site/"
STATUS=$(curl -s -o /dev/null -w "%{http_code}" \
  -X POST \
  -H "Content-Type: application/json" \
  -d '{"query":"{__typename}"}' \
  "$URL")

if [ "$STATUS" != "200" ]; then
  echo "FAIL: expected status 200 from $URL, got $STATUS"
  exit 1
fi

echo "PASS: $URL returned 200"
