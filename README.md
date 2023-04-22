# UnityCustomKeyboard


# Usage


```.command
# 1. SwiftPM から xcodeproj を出力
$ swift package generate-xcodeproj --skip-extra-files

# 2. xcodebuild を使って出力した xcodeproj から framework を作成
$ xcodebuild -project UnityCustomKeyboard.xcodeproj -scheme UnityCustomKeyboard-Package -configuration Release -sdk iphoneos CONFIGURATION_BUILD_DIR=Build

# 3. Buildフォルダ以下に生成された UnityCustomKeyboard.framework を Unityプロジェクトの Plugins/iOSフォルダにインポートする
```

