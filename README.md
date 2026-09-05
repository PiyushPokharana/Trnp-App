# TRNP Business History App

A Flutter app for managing transport and truck trading/scrap business history, transaction records, company data, and dashboards.

## Overview

TRNP helps a business owner track:

- company activity across multiple businesses
- people, vehicles, and payment accounts
- income, expenses, advances, and other transactions
- trip and deal histories
- business summaries and reporting dashboards

The app is built around a shared transaction engine with company-specific context, so transport and trading records can sit in the same system without duplicating the core ledger logic.

## Tech Stack

- Flutter
- Dart
- Riverpod
- Drift / SQLite
- Google Sign-In
- Shared Preferences
- Google Fonts

## Features

- multi-company business selector
- Google authentication flow
- local database persistence
- master data management for people, vehicles, and accounts
- transaction recording engine
- dashboard navigation screens
- report and history views
- transport and trading workflow structure

## Project Structure

- lib/ — app logic and screens
- lib/database/ — SQLite schema and Drift tables
- lib/services/ — auth and app services
- test/ — project tests
- android/ — Android configuration and app files
- ios/ — iOS configuration and app files
- linux/, macos/, windows/, web/ — platform-specific targets

## Prerequisites

Before running the app, install:

- Flutter SDK 3.6.1 or newer
- Android Studio or Xcode for your target platform
- Git
- Firebase project access for Google Sign-In configuration

## Google Sign-In / Firebase Setup

This project uses Google authentication and Firebase-based Android configuration for sign-in support.

Important:

- Do not commit your Firebase or Google auth credentials to GitHub.
- Keep your configuration files local and private.
- The repo already ignores sensitive files such as `google-services.json` and `GoogleService-Info.plist`.

Required files for local setup:

1. Android:
   - `android/app/google-services.json`

2. iOS:
   - `ios/Runner/GoogleService-Info.plist`

3. Firebase project configuration:
   - enable Google Sign-In in Firebase Authentication
   - add your Android package name and SHA-1/SHA-256 certificates
   - add your iOS bundle ID and corresponding configuration

If these files are missing, the app will not authenticate correctly in a local environment.

## Getting Started

1. Clone the repository:
   ```bash
   git clone <your-repo-url>
   cd Trnp
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Add your Google/Firebase configuration files locally:
   - Android: `android/app/google-services.json`
   - iOS: `ios/Runner/GoogleService-Info.plist`

4. Run the app:
   ```bash
   flutter run
   ```

5. Run tests:
   ```bash
   flutter test
   ```

## App Status

The project currently passes the existing test suite:

```bash
flutter test
```

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.

## Contributing

Contributions are welcome. Please open an issue or submit a pull request with a clear summary of the change.
