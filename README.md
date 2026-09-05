# TRNP Business History App

A Flutter-based business history and transaction tracking app designed for transport and truck trading/scrap businesses. The system focuses on capturing daily business activity, customer and vehicle history, transaction records, and business summaries in a simple dashboard-first experience.

## Overview

TRNP helps a business owner record and review:

- company activity across multiple businesses
- people, vehicles, and payment accounts
- transaction records such as income, expenses, payments, and advances
- trip and deal-based business history
- quick summaries and business dashboards

This project is built around a shared transaction engine and company-specific tracking model so the same app can support multiple business contexts without duplicating core ledger logic.

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
- user authentication flow
- local database persistence
- master data for people, vehicles, and accounts
- transaction recording engine
- business dashboard and navigation screens
- transport and trading workflow structure
- test coverage for app baseline

## Project Structure

- lib/ — application code and screens
- lib/database/ — local database and schema
- lib/services/ — app services
- test/ — widget and app tests
- android/, ios/, linux/, macos/, web/, windows/ — platform targets

## Prerequisites

Before running the app, install:

- Flutter SDK 3.6.1 or newer
- Android Studio / Xcode depending on your target platform
- Git

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

3. Run the app:
   ```bash
   flutter run
   ```

4. Run tests:
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
