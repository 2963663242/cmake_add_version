WORKSPACE=$(cd "$(dirname "$0")";pwd)

BUILD_DIR=$WORKSPACE/build

if [ ! -d "$BUILD_DIR" ]; then
	echo "$BUILD_DIR不存在，重新创建"
	mkdir "$BUILD_DIR"
fi

cmake -S $WORKSPACE -B "$BUILD_DIR" -G Xcode

echo 获取git版本号
svnInfoResult=`git rev-list HEAD --count`
svnVersion=${svnInfoResult##* }
DYLIB_CURRENT_VERSION="1.1.${svnVersion}"
DYLIB_COMPATIBILITY_VERSION="1.0.1"
GCC_PREPROCESSOR_DEFINITIONS="LIB_VERSION=\\\"${DYLIB_CURRENT_VERSION}\\\""



echo 编译代码

BUILD_SETTING=" -configuration $CONFIG DYLIB_CURRENT_VERSION=${DYLIB_CURRENT_VERSION} DYLIB_COMPATIBILITY_VERSION=${DYLIB_COMPATIBILITY_VERSION} GCC_PREPROCESSOR_DEFINITIONS=${GCC_PREPROCESSOR_DEFINITIONS} build"

xcodebuild -project $BUILD_DIR/test.xcodeproj -target test $BUILD_SETTING
xcodebuild -project $BUILD_DIR/test.xcodeproj -target main $BUILD_SETTING

