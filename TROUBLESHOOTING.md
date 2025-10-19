# Troubleshooting Guide

## 🔧 **Common Issues and Solutions**

### **Dependency Issues**

#### **Issue: Version solving failed**
```
Because brand_ambassador_flutter depends on [package] ^[version] which doesn't match any versions, version solving failed.
```

**Solutions:**
1. **Update Flutter SDK**
   ```bash
   flutter upgrade
   ```

2. **Clean and get dependencies**
   ```bash
   flutter clean
   flutter pub get
   ```

3. **Check package versions on pub.dev**
   - Visit [pub.dev](https://pub.dev) and search for the package
   - Use the latest stable version

4. **Use dependency overrides (if needed)**
   ```yaml
   dependency_overrides:
     package_name: ^version
   ```

#### **Issue: Package not found**
```
Could not find package [package_name].
```

**Solutions:**
1. **Check package name spelling**
2. **Verify package exists on pub.dev**
3. **Update pubspec.yaml with correct name**

### **Code Generation Issues**

#### **Issue: Build runner conflicts**
```
[SEVERE] Conflicting outputs: [file].g.dart
```

**Solutions:**
```bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```

#### **Issue: Generated files not found**
```
Error: Could not find [file].g.dart
```

**Solutions:**
1. **Run code generation**
   ```bash
   flutter packages pub run build_runner build
   ```

2. **Check if files are in .gitignore**
   - Generated files should be ignored by git
   - But should exist locally after generation

### **Build Issues**

#### **Issue: Android build fails**
```
Execution failed for task ':app:compileDebugKotlin'.
```

**Solutions:**
1. **Update Android Gradle Plugin**
   ```gradle
   // android/build.gradle
   dependencies {
       classpath 'com.android.tools.build:gradle:8.0.0'
   }
   ```

2. **Update Kotlin version**
   ```gradle
   // android/build.gradle
   ext.kotlin_version = '1.8.0'
   ```

3. **Clean and rebuild**
   ```bash
   flutter clean
   flutter build apk
   ```

#### **Issue: iOS build fails**
```
CocoaPods could not find compatible versions
```

**Solutions:**
1. **Update CocoaPods**
   ```bash
   sudo gem install cocoapods
   ```

2. **Clean iOS build**
   ```bash
   cd ios
   rm -rf Pods
   rm Podfile.lock
   pod install
   cd ..
   flutter clean
   flutter build ios
   ```

### **Runtime Issues**

#### **Issue: App crashes on startup**
```
Fatal Exception: java.lang.RuntimeException
```

**Solutions:**
1. **Check Flutter doctor**
   ```bash
   flutter doctor
   ```

2. **Verify platform setup**
   - Android: Check Android SDK and emulator
   - iOS: Check Xcode and simulator

3. **Check device compatibility**
   - Android: API 21+ (Android 5.0+)
   - iOS: iOS 11.0+

#### **Issue: Hot reload not working**
```
Hot reload failed: Connection refused
```

**Solutions:**
1. **Restart the app**
   ```bash
   flutter run
   ```

2. **Check device connection**
   ```bash
   flutter devices
   ```

3. **Restart Flutter daemon**
   ```bash
   flutter daemon --stop
   flutter run
   ```

### **Development Issues**

#### **Issue: BLoC not working**
```
Error: No BLoC found for [BlocType]
```

**Solutions:**
1. **Check BLoC provider**
   ```dart
   BlocProvider<AuthBloc>(
     create: (context) => AuthBloc(),
     child: YourWidget(),
   )
   ```

2. **Verify BLoC import**
   ```dart
   import 'package:flutter_bloc/flutter_bloc.dart';
   ```

#### **Issue: Navigation not working**
```
Error: No route found for [route]
```

**Solutions:**
1. **Check route definition**
   ```dart
   GoRoute(
     path: '/route',
     builder: (context, state) => YourPage(),
   )
   ```

2. **Verify go_router setup**
   ```dart
   MaterialApp.router(
     routerConfig: AppRouter.router,
   )
   ```

### **Performance Issues**

#### **Issue: App is slow**
```
App takes too long to load
```

**Solutions:**
1. **Check for memory leaks**
2. **Optimize images and assets**
3. **Use const constructors**
4. **Profile the app**
   ```bash
   flutter run --profile
   ```

#### **Issue: Large app size**
```
APK/IPA is too large
```

**Solutions:**
1. **Remove unused dependencies**
2. **Optimize images**
3. **Use code splitting**
4. **Enable ProGuard (Android)**
5. **Use App Bundle (Android)**

### **Testing Issues**

#### **Issue: Tests failing**
```
Test failed: [error message]
```

**Solutions:**
1. **Check test setup**
   ```dart
   setUp(() {
     // Test setup
   });
   ```

2. **Mock dependencies**
   ```dart
   when(mockRepository.getData()).thenAnswer((_) async => data);
   ```

3. **Run specific tests**
   ```bash
   flutter test test/specific_test.dart
   ```

### **Platform-Specific Issues**

#### **Android Issues**

**Issue: Permission denied**
```xml
<!-- android/app/src/main/AndroidManifest.xml -->
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.CAMERA" />
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
```

**Issue: ProGuard obfuscation**
```proguard
# android/app/proguard-rules.pro
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }
```

#### **iOS Issues**

**Issue: Podfile configuration**
```ruby
# ios/Podfile
platform :ios, '13.0'
use_frameworks!
use_modular_headers!

target 'Runner' do
  use_frameworks!
  use_modular_headers!
  flutter_install_all_ios_pods File.dirname(File.realpath(__FILE__))
end
```

**Issue: Info.plist permissions**
```xml
<!-- ios/Runner/Info.plist -->
<key>NSCameraUsageDescription</key>
<string>This app needs camera access to take photos</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>This app needs photo library access to select images</string>
```

### **Getting Help**

1. **Check Flutter documentation**
   - [Flutter.dev](https://flutter.dev)
   - [pub.dev](https://pub.dev)

2. **Search for solutions**
   - Stack Overflow
   - GitHub issues
   - Flutter community

3. **Ask for help**
   - Flutter Discord
   - Reddit r/FlutterDev
   - Flutter GitHub discussions

### **Useful Commands**

```bash
# Clean everything
flutter clean

# Get dependencies
flutter pub get

# Upgrade dependencies
flutter pub upgrade

# Check for issues
flutter doctor

# Run tests
flutter test

# Build for release
flutter build apk --release
flutter build ios --release

# Analyze code
flutter analyze

# Format code
dart format .
```

### **Prevention Tips**

1. **Keep Flutter updated**
   ```bash
   flutter upgrade
   ```

2. **Use stable package versions**
3. **Test on multiple devices**
4. **Follow Flutter best practices**
5. **Use proper error handling**
6. **Write comprehensive tests**

---

**Remember**: Most issues can be resolved by cleaning the project and getting fresh dependencies. Always try `flutter clean && flutter pub get` first!
