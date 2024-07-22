# Image Encrypt Flutter

## Decisions

- Chosen BLoC for State Management to keep Encryption & Auth Logic Separated from UI.
- Chosen Objectbox for storing Encrypted Image Details.

## Architecture

### Architecture is divided into 3 major parts

#### Application

- Contains BLoC Logic which handles all encryption and authenticaion

#### Core

- Contains Core Utilities, Services, Database and Models

#### UI

- Contains all the screens & common widgets separated into different folders accroding to their usecase

## Package Details

### SecureStorage

- Flutter Secure Storage provides API to store data in secure storage. Keychain is used in iOS, KeyStore based solution is used in Android.
- Used to store hashed user pin.

### Objecbox

- Flutter database for super-fast NoSQL ACID compliant object persistence.
- Database for storing Encrypted Image Details.

### Flutter BLoC

- State Management package and a State Management Pattern.
- BLoC pattern encourages developer to separate Business Logic from UI.

### Encrypt & Crypto

- A set of high-level APIs over PointyCastle for two-way cryptography.
- A set of cryptographic hashing functions for Dart.

### Image Picker

- A Flutter plugin for iOS and Android for picking images from the image library, and taking new pictures with the camera.

### Photo Manager

- A Flutter plugin that provides assets abstraction management APIs without UI integration, you can get assets (image/video/audio) on Android, iOS, macOS and OpenHarmony.
- Provides method to delete photo once selected by user.

### Share Plus

- Flutter plugin for sharing content via the platform share UI, using the ACTION_SEND intent on Android and UIActivityViewController on iOS.
