ESDY BUILDER ANDROID APP  v3.1   (Android 15 / API 35, works online AND offline)

FIXES IN v3.1
- Generated app icon: the icon swap now works even when the release build shortens resource
  paths (this is why every built app showed a plain cyan square). The default icon is now the
  ESDY logo, and the build stops with a clear error if the icon cannot be applied.
- Language: switching now works in every direction (English <-> Tamil <-> Hindi <-> Arabic).
  Old code could only translate English once. Dynamic parts (history, progress steps) follow too.
- Splash: builder splash waits until the screen is really painted (no white/dark flash) and the
  Android 12+ system splash no longer fades twice. Generated apps now have their own splash
  (app icon on the theme colour) instead of a blank dark screen.
- Progress bar: smooth and never freezes; follows the real stages and always ends at 100%.
- Builder now references the template app automatically: building :app builds :shell and embeds
  it as shell.apk by itself (no manual copy step, local or GitHub).
- Direct APK download: the GitHub workflow now publishes ESDY-Builder.apk as a GitHub Release
  file (Releases > latest). GitHub "Artifacts" are always zipped, Releases are not.

WHAT'S NEW IN v3
- One App Name field (the duplicate in App Settings is gone; fake "ESDY Demo App" cards removed)
- Polished UI, toasts, smooth pages, safe-area support (Android 15 edge-to-edge)
- Faster builds: progress follows the real build stages, 1% -> 100%, no fake waiting
- Download History: delete one build, clear all, install / share APK
- Permission check: scans your HTML/ZIP and tells you which permissions are needed,
  working, unused, or switched off. Generated apps now ENFORCE the switches
  (internet, camera, microphone, location, files, notifications).
- Extras: auto app name from <title>, auto package ID, Share APK, online/offline chip,
  "Make app work offline" (embeds online scripts, styles, fonts, images when you build online)
- Targets: compileSdk 35, targetSdk 35. Signed .aab workflow for Google Play.

ONLINE + OFFLINE
- ESDY Builder itself needs no internet: UI, ZIP reader (JSZip 3.10.1 bundled) and signing are inside the app.
- Premium code check is local. Build history is stored on the phone.
- Your project works offline after "Make app work offline" embeds its online files.
  Live APIs (weather, login, etc.) still need internet at run time.

BUILD IT (phone-friendly, GitHub)
1. Upload ALL files (keep the hidden .github folder) to a NEW GitHub repository.
2. Test APK:  Actions > "Build test APK"  -> Releases > latest > ESDY-Builder.apk (direct, no zip)
3. Play Store: read tools/README-KEYSTORE.txt, then Actions > "Release AAB (signed)"
   -> artifact ESDY-Builder-release-aab (app-release.aab)

BRANDING
- Logo (round blue ESDY): app launcher icon (adaptive + themed), Play 512x512 icon, 1024x500 feature graphic, header logo.
- Splash (ESDY wordmark, "Smart - Simple - Secure"): shown when the app opens (native splash, fades out once the UI is ready).
- Originals are in store-assets/source/.
STORE GRAPHICS: store-assets/ (512x512 icon, 1024x500 feature graphic)

HONEST TEST NOTES
- This source has NOT been built or run on a real device by the author of this package.
  A green GitHub build proves it compiles, not that every generated app installs and runs.
  Test with a very simple HTML page first and report the exact error if anything fails.
- Generated apps use versionCode 1 (versionName is applied). Updating an installed generated app
  by install-over works only while signed by the same key.
- The signing key for generated APKs lives in this phone's Android Keystore. If you uninstall
  ESDY Builder or lose that key, later builds cannot update apps built earlier.
- The Premium code/test toggle is for testing, not secure billing.
- Google Play restricts REQUEST_INSTALL_PACKAGES (the Install APK button). You must complete the
  Play Console declaration, or remove that permission and rely on Share / Downloads.
- Web Notification API is limited inside Android WebView; the Notifications switch only
  requests Android's notification permission.
