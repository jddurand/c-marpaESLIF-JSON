CMAKE_MINIMUM_REQUIRED (VERSION 3.0.0 FATAL_ERROR)
IF (NOT MYPACKAGEBOOTSTRAP_DONE)
  INCLUDE ("3rdparty/github/cmake-utils/cmake/MyPackageBootstrap.cmake")
ENDIF ()
MYPACKAGESTART (marpaESLIF_JSON 1 0 0)

###########
# Library #
###########
MYPACKAGELIBRARY(
  ${CMAKE_CURRENT_SOURCE_DIR}/include/marpaESLIF_JSON/internal/config.h.in
  ${INCLUDE_OUTPUT_PATH}/marpaESLIF_JSON/internal/config.h
  src/marpaESLIF_JSON.c)

###############
# Executables #
###############
MYPACKAGETESTEXECUTABLE(marpaESLIF_JSONTester     test/marpaESLIF_JSONTester.c)

################
# Dependencies #
################
MYPACKAGEDEPENDENCY (genericLogger "${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/github/genericLogger" LIBS)
MYPACKAGEDEPENDENCY (genericStack  "${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/github/genericStack"  LIBS)
MYPACKAGEDEPENDENCY (genericHash   "${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/github/genericHash"   LIBS)
MYPACKAGEDEPENDENCY (marpaESLIF    "${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/github/marpaESLIF"    LIBS)

#########
# Tests #
#########
MYPACKAGECHECK(marpaESLIF_JSONTester)

###########
# Install #
###########
#MYPACKAGEMAN("doc/API/README.pod"                 "MARPAESLIF_JSON_API"        "3" "${MARPAESLIF_JSON_VERSION}")

#############
# Packaging #
#############
MYPACKAGEPACK ("" "JSON Parser using marpaESLIF BNF")

#########
# Setup #
#########
MYPACKAGEPRINTSETUP()
