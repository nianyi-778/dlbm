# dlbm

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

打开 Android Studio 或者 VS Code 的终端 Terminal

输入下面两行命令。

flutter packages get

flutter packages pub run flutter_launcher_icons:main

flutter run --no-sound-null-safety -v

flutter build ios --no-sound-null-safety --release

完毕后，图标就会被 icon 这个源生成的各种规格和平台的图标，覆盖。

https://blog.csdn.net/icewst/article/details/122841724

<!-- 打开mac 模拟器 -->

```
open -a Simulator
```

<!-- logo -->

```
flutter pub run flutter_native_splash:create  // ios android
```
