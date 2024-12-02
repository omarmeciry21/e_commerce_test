# How to Run a Flutter App

## Demo Video

You can view the demo video by clicking the link below:

[Watch the Demo Video](./demo_video.mkv)

## Prerequisites

Before running a Flutter app, ensure you have the following installed on your machine:

- **Flutter SDK**: You can download and install Flutter from the official website: [Flutter Install](https://flutter.dev/docs/get-started/install).
- **Android Studio**: Flutter uses Android Studio for creating Android apps. You can download it from [Android Studio](https://developer.android.com/studio).
- **Xcode**: For iOS development (macOS only). Download it from the App Store.
- **Visual Studio Code** (optional): A code editor that can be used to write and run Flutter apps.

You can check if Flutter is properly installed by running:

```bash
flutter doctor
```

This command will show any missing dependencies or issues with your setup.

---

## Running the App

### 1. **Clone the Repository**

If you're starting from a Git repository, clone the Flutter project to your local machine using Git:

```bash
git clone https://github.com/your-username/flutter_app.git
cd flutter_app
```

### 2. **Install Dependencies**

Once you have the app's code on your local machine, run the following command to fetch all the necessary packages:

```bash
flutter pub get
```

This will download and install all the dependencies listed in the `pubspec.yaml` file.

### 3. **Connect a Device**

You can run your app on either an Android or iOS device:

- **Android**: You can use a physical device or an Android emulator. Ensure your device is connected via USB or an emulator is running.
- **iOS**: For macOS, you can run the app on a physical iOS device or an iOS simulator. Make sure you have Xcode installed.

To check connected devices, run:

```bash
flutter devices
```

### 4. **Run the App**

To run the app on your connected device, use the following command:

```bash
flutter run
```

This will compile the app and launch it on your device.

---

## Troubleshooting

### **Common Issues**

- **Flutter Doctor Not Detecting Dependencies**: Ensure all dependencies are correctly installed. Run `flutter doctor` to check for any missing items and resolve the issues.
- **Android Emulator Not Starting**: If the Android emulator fails to start, ensure you have installed the required SDKs and created an emulator in Android Studio.
- **App Not Running on iOS Simulator**: Ensure Xcode is installed, and the iOS simulator is set up correctly. You can open the simulator from Xcode's `Devices and Simulators` window.

---

## Additional Resources

- **Flutter Documentation**: [Flutter Docs](https://flutter.dev/docs)
- **Flutter DevTools**: For debugging and performance optimization, use [Flutter DevTools](https://flutter.dev/docs/development/tools/devtools).
- **Flutter GitHub Repository**: [Flutter GitHub](https://github.com/flutter/flutter)

