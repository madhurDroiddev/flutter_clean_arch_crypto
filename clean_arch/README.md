# Crypto Currency App - Flutter Clean Architecture

A Flutter application that demonstrates Clean Architecture principles while providing a cryptocurrency listing feature. This project showcases modern Flutter development practices with BLoC pattern, dependency injection, and clean separation of concerns.

## 🚀 Features

- **Real-time Cryptocurrency Data**: Fetch and display current cryptocurrency prices
- **Sorting Capabilities**: Sort cryptocurrencies by name or price
- **Clean Architecture**: Well-structured code following clean architecture principles
- **State Management**: BLoC pattern for reactive state management
- **Dependency Injection**: Injectable package for dependency management
- **Network Layer**: Dio for HTTP requests with proper error handling
- **Modern UI**: Material Design 3 with clean, responsive interface

## 📱 Screenshots

*[Screenshots will be added here after running the application]*

## 🏗️ Architecture Overview

This project implements Clean Architecture with three main layers:

### Presentation Layer
- **BLoC Pattern**: State management using `flutter_bloc`
- **Screens**: UI components and user interactions
- **Events & States**: Clear state management flow

### Domain Layer
- **Entities**: Core business objects (`CryptoCurrencyEntity`)
- **Use Cases**: Business logic and rules
- **Repository Interfaces**: Abstract data access contracts

### Data Layer
- **Models**: Data transfer objects and API response models
- **Repository Implementations**: Concrete data access logic
- **Data Sources**: Remote and local data sources

## 🛠️ Technologies Used

- **Flutter**: ^3.5.4
- **flutter_bloc**: ^9.0.0 - State management
- **dio**: ^5.8.0+1 - HTTP client
- **get_it**: ^8.0.3 - Dependency injection
- **injectable**: ^2.5.0 - Code generation for DI
- **cryptofont**: ^1.0.2+1 - Cryptocurrency icons
- **crypto_icons_flutter**: ^0.0.1 - Additional crypto icons

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (^3.5.4)
- Dart SDK
- Android Studio / VS Code

### Installation

1. **Install dependencies**
   ```bash
   flutter pub get
   ```

2. **Generate dependency injection code**
   ```bash
   flutter packages pub run build_runner build
   ```

3. **Run the application**
   ```bash
   flutter run
   ```

## 📊 Application Flow

1. **App Initialization**: Dependency injection setup
2. **Home Screen**: Displays cryptocurrency list
3. **Data Fetching**: Remote API calls for crypto data
4. **State Management**: BLoC handles loading, success, and error states
5. **User Interactions**: Sorting functionality (by name or price)
6. **UI Updates**: Reactive UI updates based on state changes

## 🧪 Testing

The project is structured to support comprehensive testing:
- **Unit Tests**: For use cases and business logic
- **Widget Tests**: For UI components
- **Integration Tests**: For complete feature flows

## 📈 Future Enhancements

- [ ] Add local caching with Hive or SQLite
- [ ] Implement search functionality
- [ ] Add detailed cryptocurrency information
- [ ] Implement real-time price updates
- [ ] Add portfolio tracking features
- [ ] Implement push notifications

---

**Note**: This project serves as a reference implementation of Clean Architecture in Flutter. It demonstrates best practices for building scalable and maintainable Flutter applications.
