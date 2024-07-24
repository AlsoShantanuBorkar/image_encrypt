# Image Encrypt Flutter

## Decisions

### Custom Image Picker

- Packages like image_picker & file_picker store the selected image in cache and then return the file path.
However for this usecase the original image path is required instead of cache path in order to ensure delete the original image selected by user.
Hence the solution is to create custom image picker using the photo_manager package which allows us to browse images according to albums and delete images by their id.

- Reason for using photo_manager is that it does not require entire image path to delete but rather an unique_id of the image, eg: 25.jpg, 67.png, etc .
This id is also accessible using the image_picker plugin but there are inconsistencies in the value as sometimes it returns the file_name, eg: image_abcd.jpeg and sometimes it returns unique_id, eg: 25.jpg.
This inconsistency is due to the fact that there are two options for picking the image from image_picker: Picking image as media and picking image from file manager.

- Due to these inconsistences in image_picker and the inability to fetch original image path I have created custom image selector that can resolve this issue.

- Also due to the above issue of not being able to access original image path, the decrypted image is stored in Download/ folder of the application rather than its original location.

- It is possible to get the original location of the image but it would require more time.

### User Interface

- The UI for the app is kept simple, focusing on functionality rather than appearence

## Architecture

#### Architecture is divided into 3 major parts

##### Application

- Contains BLoC Logic which handles all encryption and authenticaion

##### Core

- Contains Core Utilities, Services, Database and Models

##### UI

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

### Photo Manager

- A Flutter plugin that provides assets abstraction management APIs without UI integration, you can get assets (image/video/audio) on Android, iOS, macOS and OpenHarmony.
- Allows getting images according to their albums.
- Provides method to delete photo once selected by user.

### Share Plus

- Flutter plugin for sharing content via the platform share UI, using the ACTION_SEND intent on Android and UIActivityViewController on iOS.
