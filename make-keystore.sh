#!/usr/bin/env bash
# Creates your private ESDY release/upload keystore (PKCS12, RSA 4096, valid ~27 years).
# Run this on YOUR device (Termux: pkg install openjdk-17) - never inside a chat or a repo.
set -euo pipefail

ALIAS="${1:-esdy-upload}"
OUT="esdy-release.p12"

if [ -e "$OUT" ]; then echo "$OUT already exists - refusing to overwrite."; exit 1; fi

read -rsp "Choose a STRONG keystore password (12+ chars): " PW; echo
read -rsp "Repeat password: " PW2; echo
[ "$PW" = "$PW2" ] || { echo "Passwords do not match."; exit 1; }
[ ${#PW} -ge 12 ] || { echo "Use at least 12 characters."; exit 1; }

keytool -genkeypair -v \
  -storetype PKCS12 -keystore "$OUT" -alias "$ALIAS" \
  -keyalg RSA -keysize 4096 -sigalg SHA256withRSA -validity 10000 \
  -storepass "$PW" -keypass "$PW" \
  -dname "CN=ESDY Builder, OU=Mobile, O=ESDY, C=IN"

base64 -w0 "$OUT" > keystore.base64.txt
chmod 600 "$OUT" keystore.base64.txt

echo
echo "DONE."
echo "1) BACK UP  $OUT  and your password somewhere safe (losing it = you can never update the app)."
echo "2) Add these 3 GitHub secrets (repo > Settings > Secrets and variables > Actions):"
echo "     ESDY_KEYSTORE_BASE64   = contents of keystore.base64.txt"
echo "     ESDY_KEYSTORE_PASSWORD = the password you typed"
echo "     ESDY_KEY_ALIAS         = $ALIAS"
echo "3) Delete keystore.base64.txt afterwards. NEVER upload the .p12 to the repository."
