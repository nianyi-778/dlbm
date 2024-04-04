# dlbm

### 1. 运行环境

Flutter 3.19.3 • channel stable • https://github.com/flutter/flutter.git
Framework • revision ba39319843 (4 weeks ago) • 2024-03-07 15:22:21 -0600
Engine • revision 2e4ba9c6fb
Tools • Dart 3.3.1 • DevTools 2.31.1

### 2. 运行示例

![示例图片](https://easyv.assets.dtstack.com/data/2480/2689829/img/n5ytv6d7dm_1712241536445_txtqyjc07i.png)

### 3. logo

打开 Android Studio 或者 VS Code 的终端 Terminal

输入下面两行命令。

```
flutter packages get

flutter packages pub run flutter_launcher_icons:main

flutter run --no-sound-null-safety -v

flutter build ios --no-sound-null-safety --release
```


> 完毕后，图标就会被 icon 这个源生成的各种规格和平台的图标，覆盖。

[https://blog.csdn.net/icewst/article/details/122841724](https://blog.csdn.net/icewst/article/details/122841724)

### 4. mac 打开 iphone 模拟器

`open -a Simulator`

### 5. logo 自动生成

```
flutter pub run flutter_native_splash:create  // ios android
```



