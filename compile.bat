chcp 65001

if not exist build (
	mkdir build
	echo "构建目录不存在，重新创建"
	)

cmake -S . -B build

cmake --build build