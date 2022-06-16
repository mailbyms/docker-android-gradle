# docker-android-gradle
用于编译 Android 项目的 gradle 环境

git 的各个分支对应不同版本组合  

编译 Android 项目的环境，主要参数为 gradle 版本、build_tool_version  
一般在项目配置文件能找到：  
- `build.gradle` 的 `buildToolsVersion` 定义了 SDK 的版本
- `gradle\wrapper\gradle-wrapper.properties` 定义了 gradle 的版本

Master 分支的是 6.1.1-30.0.0
