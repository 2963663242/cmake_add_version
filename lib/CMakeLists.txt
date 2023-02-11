

# 获取git版本信息
	# 获取git hash
	execute_process(
	  COMMAND git log -1 --format=%H   
	  WORKING_DIRECTORY ${PROJECT_SOURCE_DIR} 
	  OUTPUT_VARIABLE COMMIT_HASH
	)
	string(SUBSTRING ${COMMIT_HASH} 0 8 COMMIT_HASH)
	message(STATUS "git hash= ${COMMIT_HASH}")

	# 获取当前分支名称
	execute_process(
	  COMMAND git rev-parse --abbrev-ref HEAD   
	  WORKING_DIRECTORY ${PROJECT_SOURCE_DIR} 
	  OUTPUT_VARIABLE CURRENT_BRANCH
	)
	string(SUBSTRING ${CURRENT_BRANCH} 0 1 CURRENT_BRANCH)
	message(STATUS "git current branch = ${CURRENT_BRANCH}")

	# 获取提交次数
	execute_process(
	  COMMAND git rev-list HEAD --count  
	  WORKING_DIRECTORY ${PROJECT_SOURCE_DIR} 
	  OUTPUT_VARIABLE COMMIT_COUNT
	)
	string(STRIP ${COMMIT_COUNT} COMMIT_COUNT)
	message(STATUS "git COMMIT_COUNT = ${COMMIT_COUNT}")

	# 生成版本信息
	set(VER "${COMMIT_COUNT}-${CURRENT_BRANCH}-${COMMIT_HASH}")
	message(STATUS "version info = ${VER}")




IF(MSVC)
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/version.rc.in ${CMAKE_BINARY_DIR}/version.rc)
file(GLOB RCFILE ${CMAKE_BINARY_DIR}/*.rc)
ENDIF()

file(GLOB SOURCEFILE "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp" "${CMAKE_CURRENT_SOURCE_DIR}/*.h")

add_library(test SHARED ${SOURCEFILE} ${RCFILE})