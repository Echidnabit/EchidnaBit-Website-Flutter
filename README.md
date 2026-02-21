# Echidnabit Website (Flutter)

Landing page for the Echidnabit mobile app business, built with Flutter web and deployed with GitHub Pages.

## Local development

```bash
flutter pub get
flutter run -d chrome
```

## GitHub Pages deployment

Deployment is handled by GitHub Actions using `.github/workflows/deploy.yml`.

The workflow:
1. Installs Flutter.
2. Builds the web app.
3. Adds a `404.html` SPA fallback for deep links like `/privacy-policy`.
4. Uploads and deploys to GitHub Pages.
