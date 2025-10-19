# Brand Ambassador Flutter App

A comprehensive Flutter application for managing brand ambassador programs, built with clean architecture and modern design patterns.

## 🚀 **Features**

- **Multi-Role Support**: Brand, Influencer, and Super Admin dashboards
- **Campaign Management**: Create, manage, and track influencer campaigns
- **Influencer Management**: Recruit, approve, and manage brand ambassadors
- **Analytics & Reporting**: Comprehensive metrics and ROI tracking
- **Real-time Communication**: Chat, messaging, and collaboration tools
- **Blockchain Integration**: Campaign verification and transparency
- **Payment Systems**: Credit management and influencer payouts

## 🏗️ **Architecture**

This project follows **Clean Architecture** principles with:

- **BLoC Pattern** for state management
- **Repository Pattern** for data access
- **Use Cases** for business logic
- **Dependency Injection** for loose coupling
- **Feature-based** folder structure

### **Project Structure**

```
lib/
├── core/                    # Core functionality
│   ├── constants/          # App constants
│   ├── error/             # Error handling
│   ├── network/           # API client
│   ├── theme/             # App theming
│   └── utils/             # Utility functions
├── features/              # Feature modules
│   ├── auth/             # Authentication
│   ├── dashboard/        # Dashboard screens
│   ├── campaigns/        # Campaign management
│   ├── influencers/      # Influencer management
│   └── analytics/        # Analytics & reporting
├── shared/               # Shared components
│   ├── models/          # Data models
│   ├── widgets/         # Reusable widgets
│   └── services/        # Shared services
└── main.dart            # App entry point
```

## 🛠️ **Tech Stack**

- **Flutter**: 3.10.0+
- **Dart**: 3.0.0+
- **State Management**: flutter_bloc
- **Navigation**: go_router
- **HTTP Client**: dio + retrofit
- **Local Storage**: hive + shared_preferences
- **Charts**: fl_chart
- **UI Components**: Custom design system
- **Testing**: flutter_test + bloc_test

## 📱 **Getting Started**

### **Prerequisites**

- Flutter SDK 3.10.0 or higher
- Dart SDK 3.0.0 or higher
- Android Studio / VS Code
- Git

### **Installation**

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd brand_ambassador_flutter
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code**
   ```bash
   flutter packages pub run build_runner build
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

### **Development Setup**

1. **Install Flutter dependencies**
   ```bash
   flutter pub get
   ```

2. **Generate code (models, API clients)**
   ```bash
   flutter packages pub run build_runner build --delete-conflicting-outputs
   ```

3. **Run in debug mode**
   ```bash
   flutter run --debug
   ```

4. **Run tests**
   ```bash
   flutter test
   ```

## 🎨 **Design System**

The app uses a custom design system with:

- **Dark Theme**: Primary background (#151515), Cards (#292929)
- **Typography**: Outfit (headings), Gilroy (body)
- **Colors**: Blue accent (#3B82F6), Status colors
- **Components**: Custom buttons, inputs, cards, badges
- **Responsive**: ScreenUtil for adaptive sizing

## 📋 **Development Workflow**

### **Feature Development**

1. **Create feature branch**
   ```bash
   git checkout -b feature/feature-name
   ```

2. **Follow the architecture pattern**
   - Create feature folder in `lib/features/`
   - Implement BLoC pattern
   - Add domain use cases
   - Create data repositories

3. **Use shared components**
   - Leverage widgets in `lib/shared/widgets/`
   - Follow design system
   - Use common utilities

4. **Write tests**
   - Unit tests for business logic
   - Widget tests for UI
   - Integration tests for flows

5. **Submit PR**
   - Code review required
   - All tests must pass
   - Follow coding standards

### **Screen Development Priority**

See [DEVELOPMENT_ROADMAP.md](./DEVELOPMENT_ROADMAP.md) for the complete list of screens to be developed in order.

## 🧪 **Testing**

### **Running Tests**

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/features/auth/presentation/bloc/auth_bloc_test.dart

# Run tests with coverage
flutter test --coverage
```

### **Test Structure**

- **Unit Tests**: Business logic and use cases
- **Widget Tests**: UI components and screens
- **Integration Tests**: End-to-end user flows
- **BLoC Tests**: State management testing

## 🚀 **Build & Deployment**

### **Debug Build**

```bash
flutter build apk --debug
flutter build ios --debug
```

### **Release Build**

```bash
flutter build apk --release
flutter build ios --release
```

### **Web Build**

```bash
flutter build web --release
```

## 📚 **API Integration**

The app integrates with:

- **Authentication API**: Login, registration, token management
- **Campaign API**: CRUD operations for campaigns
- **Influencer API**: Management and analytics
- **Analytics API**: Metrics and reporting
- **Payment API**: Credits and payouts
- **Blockchain API**: Verification and transparency

## 🔐 **Security**

- **Authentication**: JWT tokens with refresh
- **Data Encryption**: Sensitive data encryption
- **API Security**: HTTPS, request signing
- **Local Storage**: Encrypted local data
- **Biometric Auth**: Fingerprint/Face ID support

## 📱 **Platform Support**

- **Android**: API 21+ (Android 5.0+)
- **iOS**: iOS 11.0+
- **Web**: Modern browsers
- **Desktop**: Windows, macOS, Linux

## 🤝 **Contributing**

1. Fork the repository
2. Create a feature branch
3. Follow the coding standards
4. Write tests for new features
5. Submit a pull request

### **Coding Standards**

- Follow Dart/Flutter style guide
- Use meaningful variable names
- Add documentation for public APIs
- Write comprehensive tests
- Follow the established architecture

## 📞 **Support**

For questions and support:

- Check the [DEVELOPMENT_ROADMAP.md](./DEVELOPMENT_ROADMAP.md)
- Review existing implementations
- Follow the established patterns
- Ask for code reviews

## 📄 **License**

This project is licensed under the MIT License - see the LICENSE file for details.

## 🙏 **Acknowledgments**

- Original React/TypeScript implementation
- Flutter community and packages
- Design system inspiration
- Clean architecture principles

---

**Happy Coding! 🚀**
