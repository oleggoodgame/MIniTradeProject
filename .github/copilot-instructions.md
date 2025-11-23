# AI Agent Instructions for mini_cash Flutter Project

## Project Overview
mini_cash is a Flutter application that implements a basic authentication system using Firebase. The project follows a clean architecture pattern with clear separation of concerns.

## Architecture & Structure

### Domain Layer (`lib/domain/`)
- Contains business logic and entities
- Uses Freezed for immutable data classes
- Example: `sign_up` domain with request/response models and repository interfaces

### Data Layer (`lib/data/`)
- Implements repositories and data sources
- Firebase integration (Authentication and Firestore)
- Example: `firebase_database.dart` handles Firestore operations

### Presentation Layer (`lib/presentation/`)
- Contains UI components using Flutter widgets
- Organized by features (e.g., `authentication/`)
- Uses `flutter_riverpod` for state management

## Key Technologies & Dependencies
```yaml
dependencies:
  email_validator: ^3.0.0
  riverpod: ^3.0.3
  flutter_riverpod: ^3.0.3
  freezed_annotation: ^2.4.1
  firebase_core: ^4.0.0
  firebase_auth: ^6.0.1
  firebase_storage: ^13.0.1
  cloud_firestore: ^6.0.0
```

## Development Workflows

### Authentication Flow
1. UI components in `presentation/authentication/`
2. Domain logic in `domain/sign_up/`
3. Firebase integration in `data/database/`

### State Management
- Uses Riverpod providers (see `*_provider.dart` files)
- Example: `signUpRepositoryProvider` in `sign_up_repository.dart`

### Code Generation
Generated files using Freezed and json_serializable:
- Run `flutter pub run build_runner build` after modifying annotated classes
- Generated files have `.freezed.dart` and `.g.dart` extensions

## Project-Specific Patterns

### Repository Pattern
- Abstract interfaces in `domain/*/repository/i*_repository.dart`
- Implementations in `domain/*/repository/*_repository.dart`
- Example: `ISignUpRepository` → `SignUpRepository`

### Firebase Integration
- User authentication through `FirebaseAuth`
- User profiles stored in Firestore
- Collection structure: `users/{uid}` with fields: name, email, isLoggedIn

### Form Validation
- Email validation using `email_validator` package
- Password requirements: minimum 6 characters
- Example implementations in `log_in_screen.dart` and `sign_up_screen.dart`

## Common Tasks & Examples

### Adding a New Feature
1. Create domain models with Freezed annotations
2. Implement repository interface and concrete class
3. Create UI components using Riverpod for state
4. Run code generation if needed

### Implementing Firebase Operations
```dart
// Example from firebase_database.dart
Future<void> createProfile(String uid, Account account) async {
  await _db.collection("users").doc(uid).set({
    'name': account.name,
    'email': account.email,
    'isLoggedIn': account.isLoggedIn,
  });
}
```

## Integration Points
- Firebase Authentication: User sign-up/login
- Firestore: User profile storage
- Riverpod: State management and dependency injection

Remember to follow the established architecture patterns when making changes and always run code generation after modifying annotated classes.