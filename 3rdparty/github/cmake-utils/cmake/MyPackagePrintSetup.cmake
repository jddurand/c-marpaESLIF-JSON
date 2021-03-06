MACRO (MYPACKAGEPRINTSETUP)
  #
  # Print Setup
  #
  MESSAGE(STATUS "================================")
  MESSAGE(STATUS "${PROJECT_NAME} Setup:")
  MESSAGE(STATUS "                        VERSION: ${${PROJECT_NAME}_VERSION}")
  MESSAGE(STATUS "                  VERSION_MAJOR: ${${PROJECT_NAME}_VERSION_MAJOR}")
  MESSAGE(STATUS "                  VERSION_MINOR: ${${PROJECT_NAME}_VERSION_MINOR}")
  MESSAGE(STATUS "                  VERSION_PATCH: ${${PROJECT_NAME}_VERSION_PATCH}")
  MESSAGE(STATUS "                   CMAKE_SYSTEM: ${CMAKE_SYSTEM}")
  MESSAGE(STATUS "         CMAKE_SYSTEM_PROCESSOR: ${CMAKE_SYSTEM_PROCESSOR}")
  MESSAGE(STATUS "               CMAKE_CFG_INTDIR: ${CMAKE_CFG_INTDIR}")
  MESSAGE(STATUS "               CMAKE_BUILD_TYPE: ${CMAKE_BUILD_TYPE}")
  MESSAGE(STATUS "               CMAKE_C_COMPILER: ${CMAKE_C_COMPILER}")
  MESSAGE(STATUS "            CMAKE_C_COMPILER_ID: ${CMAKE_C_COMPILER_ID}")
  MESSAGE(STATUS "                  CMAKE_C_FLAGS: ${CMAKE_C_FLAGS}")
  MESSAGE(STATUS "             CMAKE_CXX_COMPILER: ${CMAKE_CXX_COMPILER}")
  MESSAGE(STATUS "          CMAKE_CXX_COMPILER_ID: ${CMAKE_CXX_COMPILER_ID}")
  MESSAGE(STATUS "                CMAKE_CXX_FLAGS: ${CMAKE_CXX_FLAGS}")
  MESSAGE(STATUS "                   CMAKE_LINKER: ${CMAKE_LINKER}")
  MESSAGE(STATUS "         CMAKE_EXE_LINKER_FLAGS: ${CMAKE_EXE_LINKER_FLAGS}")
  MESSAGE(STATUS "                       CMAKE_AR: ${CMAKE_AR}")
  MESSAGE(STATUS "                   CMAKE_RANLIB: ${CMAKE_RANLIB}")
  MESSAGE(STATUS "               CMAKE_BINARY_DIR: ${CMAKE_BINARY_DIR}")
  MESSAGE(STATUS "               CMAKE_SOURCE_DIR: ${CMAKE_SOURCE_DIR}")
  MESSAGE(STATUS "       CMAKE_CURRENT_BINARY_DIR: ${CMAKE_CURRENT_BINARY_DIR}")
  MESSAGE(STATUS "       CMAKE_CURRENT_SOURCE_DIR: ${CMAKE_CURRENT_SOURCE_DIR}")
  MESSAGE(STATUS "              CMAKE_MODULE_PATH: ${CMAKE_MODULE_PATH}")
  MESSAGE(STATUS " CMAKE_ARCHIVE_OUTPUT_DIRECTORY: ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY}")
  MESSAGE(STATUS " CMAKE_LIBRARY_OUTPUT_DIRECTORY: ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}")
  MESSAGE(STATUS " CMAKE_RUNTIME_OUTPUT_DIRECTORY: ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}")
  GET_DIRECTORY_PROPERTY (DirDefs COMPILE_DEFINITIONS)
  FOREACH (d ${DirDefs})
    MESSAGE(STATUS "            COMPILE_DEFINITIONS: ${d}")
  ENDFOREACH()
  MESSAGE(STATUS "================================")
ENDMACRO()
