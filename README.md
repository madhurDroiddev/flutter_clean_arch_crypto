# Flutter Clean Architecture Crypto App

A Flutter application demonstrating Clean Architecture principles with a cryptocurrency listing feature. This project showcases best practices in Flutter development using BLoC pattern, dependency injection, and clean separation of concerns.

## 🚀 Features

- **Cryptocurrency Listing**: Display real-time cryptocurrency data
- **Sorting Functionality**: Sort cryptocurrencies by name or price
- **Clean Architecture**: Well-structured code following clean architecture principles
- **State Management**: BLoC pattern for reactive state management
- **Dependency Injection**: Injectable package for dependency management
- **Network Layer**: Dio for HTTP requests with proper error handling
- **Modern UI**: Material Design 3 with clean, responsive interface

## 📱 Screenshots

*[Screenshots will be added here after running the application]*

## 🏗️ Project Structure

```
clean_arch/
├── lib/
│   ├── configs/                    # Application configurations
│   │   ├── arch_core/             # Core architecture components
│   │   │   ├── base_data_source.dart
│   │   │   ├── base_use_case.dart
│   │   │   ├── concrete_data_source.dart
│   │   │   └── error_model.dart
│   │   ├── dependency/            # Dependency injection setup
│   │   │   ├── core/
│   │   │   │   ├── injection_container.dart
│   │   │   │   └── injection_container.config.dart
│   │   │   └── modules/
│   │   └── network/               # Network layer configuration
│   │       ├── network_response_model.dart
│   │       └── network_util.dart
│   ├── feature/                   # Feature modules
│   │   └── home/                  # Home feature
│   │       ├── data/              # Data layer
│   │       │   ├── model/         # Data models
│   │       │   │   └── crypto_currency_list_response_model.dart
│   │       │   ├── repository/    # Repository implementations
│   │       │   └── sources/       # Data sources
│   │       │       └── remote/
│   │       │           └── home_remote_data_source.dart
│   │       ├── domain/            # Domain layer
│   │       │   ├── entities/      # Business entities
│   │       │   │   └── crypto_currency.dart
│   │       │   ├── repository/    # Repository interfaces
│   │       │   └── use_cases/     # Business logic
│   │       └── presentation/      # Presentation layer
│   │           ├── bloc/          # BLoC state management
│   │           │   ├── home_bloc.dart
│   │           │   ├── home_event.dart
│   │           │   └── home_state.dart
│   │           └── screens/       # UI screens
│   │               └── home_screen.dart
│   └── main.dart                  # Application entry point
├── pubspec.yaml                   # Dependencies and project configuration
└── README.md
```

## 🏛️ Clean Architecture Implementation

This project follows Clean Architecture principles with clear separation of concerns across three main layers:

### 1. **Presentation Layer** (`presentation/`)
- **BLoC Pattern**: State management using `flutter_bloc`
- **Screens**: UI components and user interactions
- **Events & States**: Clear state management flow

### 2. **Domain Layer** (`domain/`)
- **Entities**: Core business objects (`CryptoCurrencyEntity`)
- **Use Cases**: Business logic and rules
- **Repository Interfaces**: Abstract data access contracts

### 3. **Data Layer** (`data/`)
- **Models**: Data transfer objects and API response models
- **Repository Implementations**: Concrete data access logic
- **Data Sources**: Remote and local data sources

## 🛠️ Technologies & Dependencies

### Core Dependencies
- **Flutter**: ^3.5.4
- **flutter_bloc**: ^9.0.0 - State management
- **dio**: ^5.8.0+1 - HTTP client
- **get_it**: ^8.0.3 - Dependency injection
- **injectable**: ^2.5.0 - Code generation for DI
- **cryptofont**: ^1.0.2+1 - Cryptocurrency icons
- **crypto_icons_flutter**: ^0.0.1 - Additional crypto icons

### Development Dependencies
- **flutter_lints**: ^4.0.0 - Code quality
- **injectable_generator**: - DI code generation
- **build_runner**: - Code generation

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (^3.5.4)
- Dart SDK
- Android Studio / VS Code

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd clean_arch
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate dependency injection code**
   ```bash
   flutter packages pub run build_runner build
   ```

4. **Run the application**
   ```bash
   flutter run
   ```

## 🎯 Key Features Implementation

### 1. **Dependency Injection**
- Uses `get_it` and `injectable` for service locator pattern
- Automatic code generation for dependency registration
- Clean separation of concerns

### 2. **State Management**
- BLoC pattern for reactive state management
- Clear event-driven architecture
- Proper error handling and loading states

### 3. **Network Layer**
- Dio HTTP client with interceptors
- Proper error handling and response models
- Network utility classes for common operations

### 4. **Clean Architecture Benefits**
- **Testability**: Each layer can be tested independently
- **Maintainability**: Clear separation of concerns
- **Scalability**: Easy to add new features
- **Flexibility**: Easy to swap implementations

## 📊 Application Flow

1. **App Initialization**: Dependency injection setup
2. **Home Screen**: Displays cryptocurrency list
3. **Data Fetching**: Remote API calls for crypto data
4. **State Management**: BLoC handles loading, success, and error states
5. **User Interactions**: Sorting functionality (by name or price)
6. **UI Updates**: Reactive UI updates based on state changes

## 🔧 Architecture Patterns

### Repository Pattern
- Abstract repository interfaces in domain layer
- Concrete implementations in data layer
- Easy to swap data sources

### Use Case Pattern
- Single responsibility principle
- Business logic encapsulation
- Easy to test and maintain

### BLoC Pattern
- Event-driven state management
- Clear separation of UI and business logic
- Reactive programming approach

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

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Follow clean architecture principles
4. Add tests for new features
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License.

---

**Note**: This project serves as a reference implementation of Clean Architecture in Flutter. It demonstrates best practices for building scalable and maintainable Flutter applications.