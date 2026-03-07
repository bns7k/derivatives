# Android APK wrapper (separate from web app)

This folder contains a native Android WebView wrapper that loads the existing web course UI from local assets.

- **Web app stays untouched** in repository root (`index.html`, `options.pdf`).
- Android app uses generated assets in `app/src/main/assets/`.
- To keep PRs reviewable, the copied assets are **not committed** in `android-app`.

## Sync assets after web changes (optional manual)

From repo root:

```bash
./scripts/sync-android-assets.sh
```

## Build APK (local machine with Android SDK)

1. Install Android Studio (or Android SDK command-line tools).
2. Ensure `ANDROID_HOME` or `ANDROID_SDK_ROOT` is set.
3. From `android-app/`:

```bash
./gradlew assembleDebug
```

The Android build runs `syncWebAssets` automatically before `preBuild`, so `index.html` and `options.pdf` are copied from the repo root.

Generated APK path:

```text
android-app/app/build/outputs/apk/debug/app-debug.apk
```

## Notes

- This app intentionally wraps the **same** SPA and preserves all existing features.
- `localStorage`-based progress/settings/review memory remain available inside the Android WebView.

## Build in GitHub (no local SDK needed)

A workflow is included at `.github/workflows/android-apk.yml`.

- Go to **Actions → Build Android APK → Run workflow**.
- Download artifact: `derivatives-course-debug-apk`.

