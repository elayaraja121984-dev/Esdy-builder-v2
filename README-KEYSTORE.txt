SIGNED .AAB - HOW IT WORKS

Why you make the keystore yourself:
A release key must be created and kept only by you. A key generated in a chat or
a shared download would not be secret, so this project never contains one.

1. On your phone (Termux) or PC with Java 17:
      bash tools/make-keystore.sh esdy-upload
2. Back up esdy-release.p12 + the password (cloud drive you trust AND offline copy).
3. In GitHub: Settings > Secrets and variables > Actions > New repository secret:
      ESDY_KEYSTORE_BASE64   (text of keystore.base64.txt)
      ESDY_KEYSTORE_PASSWORD
      ESDY_KEY_ALIAS         (esdy-upload)
4. Actions > "Release AAB (signed)" > Run workflow.
5. Download artifact "ESDY-Builder-release-aab" -> app-release.aab.
6. Play Console: create app > Release > upload the .aab and turn ON "Play App Signing".
   Your keystore then acts as the UPLOAD key (Google keeps the final app-signing key).
   Upload the 512x512 icon and the 1024x500 feature graphic from store-assets/.

Targets: compileSdk 35, targetSdk 35 (Android 15), minSdk 29, 64-bit ready (no native code).
