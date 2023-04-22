# UnityCustomKeyboard

# UPM Package

After Unity 2019.3.4f1, Unity 2020.1a21, that support path query parameter of git package. 

1. Open your Unity project.
2. Open `Window -> Package Manager`.
3. Click "+" > "Add package from git URL...".
4. Enter `https://github.com/nkjzm/iOSCustomKeyboardForUnity.git?path=Unity/Assets` and click "Add".

# Usage

```.command
# 1. SwiftPM から xcodeproj を出力
$ swift package generate-xcodeproj --skip-extra-files

# 2. xcodebuild を使って出力した xcodeproj から framework を作成
$ xcodebuild -project UnityCustomKeyboard.xcodeproj -scheme UnityCustomKeyboard-Package -configuration Release -sdk iphoneos CONFIGURATION_BUILD_DIR=Build

# 3. Buildフォルダ以下に生成された UnityCustomKeyboard.framework を Unityプロジェクトの Plugins/iOSフォルダにインポートする
```

