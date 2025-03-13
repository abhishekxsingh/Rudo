# Rudo App

## Overview

Rudo is a financial management application designed to help users track their expenses, manage budgets, and improve their financial well-being. It leverages Firebase services for authentication and data storage while providing a seamless user experience.

## Features

- **User Authentication**: Secure login and registration via Firebase.
- **App Tour**: A guided tour for first-time users.
- **Splash Screen**: Engaging startup screen.
- **Firebase Integration**: Backend support for user data.
- **BLoC Architecture**: Efficient state management.

## Installation

### Prerequisites

Ensure you have the following installed:

- Flutter SDK (latest version)
- Dart
- Android Studio/Xcode (for emulator support)
- Firebase configured for Flutter

### Steps

1. Clone the repository:
   ```sh
   git clone https://github.com/abhishekxsingh/Rudo.git
   ```
2. Navigate to the project directory:
   ```sh
   cd rudo-app
   ```
3. Install dependencies:
   ```sh
   flutter pub get
   ```
4. Configure Firebase:
   - Add `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) to the respective directories.
   - Enable Firebase authentication.
5. Run the app:
   ```sh
   flutter run
   ```

## Folder Structure

```
lib/
│── blocs/          # State management (BLoC pattern)
│── screens/        # UI components and screens
│── services/       # handling (Firebase)
│── main.dart       # Entry point of the application
```

## Development

- Follow the **BLoC architecture** pattern for state management.
- Use **Firebase** for authentication and backend services.
- Ensure code follows clean architecture principles.

## Contributing

1. Fork the repository.
2. Create a new branch (`feature-branch`).
3. Commit your changes.
4. Push to your branch and submit a pull request.

## License

This project is licensed under the MIT License.

