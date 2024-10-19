# ThinMP_Flutter

This app is a simple music player for Android and iOS.

## Demo

### Android

<img src="https://github.com/user-attachments/assets/50e3db06-3e94-4901-bbad-2945e869a604" width="156"> <img src="https://github.com/user-attachments/assets/77ab61ec-7508-45d3-818a-22568ee0fad8" width="156"> <img src="https://github.com/user-attachments/assets/21ffa98d-dd17-41fd-95c1-ef9904efd928" width="156"> <img src="https://github.com/user-attachments/assets/8b20922c-b690-4d72-bf92-698b4af0b13c" width="156"> <img src="https://github.com/user-attachments/assets/feca49bc-5b6d-4400-89e8-5f02dab4367f" width="156">

### iOS

<img src="https://github.com/user-attachments/assets/38f93429-0880-423f-88a0-b875c09fe1e6" width="156"> <img src="https://github.com/user-attachments/assets/e49f468c-21fc-4910-bd05-632482ab9aff" width="156"> <img src="https://github.com/user-attachments/assets/917b5f8c-b4d5-4d15-8385-c64deafdc830" width="156"> <img src="https://github.com/user-attachments/assets/ce7beb33-00a7-4bd7-a679-2bcb1429e777" width="156"> <img src="https://github.com/user-attachments/assets/f40e8108-b300-44eb-9b58-53cf5f81d37f" width="156">

## Features

* device music play
* background play
* favorite artists
* favorite songs
* playlists
* shortcuts

## Environments

### Flutter

* Flutter
* Dart
* Visual Studio Code

### Android

* Android Studio Koala | 2024.1.1
* Kotlin
* minSdkVersion 33
* targetSdkVersion 34
* Google Pixel 4a (Android Version 13)
* Google Pixel 7 Pro (Android Version 14)

### iOS

* Xcode 16.0
* Swift
* iOS Deployment Target 16
* iPhone 12 mini (iOS 16)
* iPhone 14 Plus (iOS 18)
* iPad Pro (6th generation, iPadOS 18, 12.9-inch)

## Libraries

* flutter_launcher_icons - https://pub.dev/packages/flutter_launcher_icons
* flutter_localizations - https://docs.flutter.dev/ui/accessibility-and-internationalization/internationalization
* flutter_riverpod - https://pub.dev/packages/flutter_riverpod
* Material Icons - https://fonts.google.com/icons
* permission_handler - https://pub.dev/packages/permission_handler
* pigeon - https://pub.dev/packages/pigeon
* shared_preferences - https://pub.dev/packages/shared_preferences

## Command

### riverpod

```
dart run build_runner build
```

### pigeon

```
dart run pigeon --input pigeon/audio.dart
```

### localizations

```
flutter pub get
```

### app icon
```
flutter pub run flutter_launcher_icons:main
```

### realm
```
dart run realm generate
```

### format
```
dart format $(find ./lib/* -name "*.dart" -not -path "*.g.dart" -not -path "*.realm.dart") -l 200
```
