# cmake_add_version
一个项目使用cmake添加文件版本信息的demo

效果是打印hello,动态库里会添加版本信息

#### 生成方法

##### windows

运行compile.bat

##### macos

运行compile.sh

#### 实际效果

##### windows

查看文件属性的版本信息即可

##### macos

使用`otool -L <name>.dylib`

