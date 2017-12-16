# Module for locating marpaESLIF, based on ICU module.
#
# Cutomizable variables:
#   MARPAESLIF_ROOT_DIR
#     This variable points to the marpaESLIF root directory. On Windows the
#     library location typically will have to be provided explicitly using the
#     -D command-line option. Alternatively, an environment variable can be set.
#
# Read-Only variables:
#   MARPAESLIF_FOUND
#     Indicates whether the library has been found.
#
#   MARPAESLIF_INCLUDE_DIRS
#     Points to the marpaESLIF include directory.
#
#   MARPAESLIF_LIBRARIES
#     Points to the marpaESLIF libraries that should be passed to
#     target_link_libraries in dynamic mode.
#
#   MARPAESLIF_LIBRARIES_STATIC
#     Points to the marpaESLIF libraries static that should be passed to
#     target_link_libraries in static mode.
#
#   MARPAESLIF_LINK_FLAGS
#     Linker flags when building linking against marpaESLIF. Defaults to "libmarpaESLIF". Take care, this is a list.
#
#   MARPAESLIF_STATIC_LINK_FLAGS
#     Linker flags when building linking against static marpaESLIF. Defaults to "libmarpaESLIF_static". Take care, this is a list.
#
#   MARPAESLIF_LDFLAGS
#     Stringified version of MARPAESLIF_LINK_FLAGS
#
#   MARPAESLIF_STATIC_LDFLAGS
#     Stringified version of MARPAESLIF_STATIC_LINK_FLAGS
#
INCLUDE (CMakeParseArguments)
INCLUDE (FindPackageHandleStandardArgs)

SET (_PF86 "ProgramFiles(x86)")
SET (_MARPAESLIF_POSSIBLE_DIRS
  ${MARPAESLIF_ROOT_DIR}
  "$ENV{MARPAESLIF_ROOT_DIR}"
  "C:/marpaESLIF"
  "$ENV{PROGRAMFILES}/marpaESLIF"
  "$ENV{${_PF86}}/marpaESLIF")

SET (_MARPAESLIF_POSSIBLE_INCLUDE_SUFFIXES include)

IF (CMAKE_SIZEOF_VOID_P EQUAL 8)
  SET (_MARPAESLIF_POSSIBLE_LIB_SUFFIXES lib64)
  SET (_MARPAESLIF_POSSIBLE_BIN_SUFFIXES bin64)

  IF (NOT WIN32)
    LIST (APPEND _MARPAESLIF_POSSIBLE_LIB_SUFFIXES lib)
    LIST (APPEND _MARPAESLIF_POSSIBLE_BIN_SUFFIXES bin)
  ENDIF (NOT WIN32)
ELSE (CMAKE_SIZEOF_VOID_P EQUAL 8)
  SET (_MARPAESLIF_POSSIBLE_LIB_SUFFIXES lib)
  SET (_MARPAESLIF_POSSIBLE_BIN_SUFFIXES bin)
ENDIF (CMAKE_SIZEOF_VOID_P EQUAL 8)

FIND_PATH (MARPAESLIF_ROOT_DIR
  NAMES include/marpaESLIF.h
  PATHS ${_MARPAESLIF_POSSIBLE_DIRS}
  DOC "marpaESLIF root directory")

IF (MARPAESLIF_ROOT_DIR)
  # Re-use the previous path:
  FIND_PATH (MARPAESLIF_INCLUDE_DIR
    NAMES marpaESLIF.h
    PATHS ${MARPAESLIF_ROOT_DIR}
    PATH_SUFFIXES ${_MARPAESLIF_POSSIBLE_INCLUDE_SUFFIXES}
    DOC "marpaESLIF include directory"
    # NO_DEFAULT_PATH
    )
ELSE (MARPAESLIF_ROOT_DIR)
  # Use default path search
  FIND_PATH (MARPAESLIF_INCLUDE_DIR
    NAMES marpaESLIF.h
    DOC "marpaESLIF include directory"
    )
ENDIF (MARPAESLIF_ROOT_DIR)

IF (NOT MARPAESLIF_FIND_COMPONENTS)
  SET (MARPAESLIF_FIND_COMPONENTS marpaESLIF)
ENDIF (NOT MARPAESLIF_FIND_COMPONENTS)

IF (MARPAESLIF_INCLUDE_DIR)
  # Loop over each components
  FOREACH (_MARPAESLIF_COMPONENT ${MARPAESLIF_FIND_COMPONENTS})
    SET (_MARPAESLIF_COMPONENT_BASE ${_MARPAESLIF_COMPONENT})
    SET (_MARPAESLIF_COMPONENT_POSSIBLE_DEBUG_NAMES ${_MARPAESLIF_COMPONENT_BASE}d)
    SET (_MARPAESLIF_COMPONENT_POSSIBLE_RELEASE_NAMES ${_MARPAESLIF_COMPONENT_BASE})

    SET (_MARPAESLIF_STATIC_COMPONENT_BASE "${_MARPAESLIF_COMPONENT}_static")
    SET (_MARPAESLIF_STATIC_COMPONENT_POSSIBLE_DEBUG_NAMES ${_MARPAESLIF_STATIC_COMPONENT_BASE}d)
    SET (_MARPAESLIF_STATIC_COMPONENT_POSSIBLE_RELEASE_NAMES ${_MARPAESLIF_STATIC_COMPONENT_BASE})

    STRING (TOUPPER ${_MARPAESLIF_COMPONENT} _MARPAESLIF_COMPONENT_UPPER)
    SET (_MARPAESLIF_LIBRARY_BASE MARPAESLIF_${_MARPAESLIF_COMPONENT_UPPER}_LIBRARY)
    SET (_MARPAESLIF_STATIC_LIBRARY_BASE MARPAESLIF_STATIC_${_MARPAESLIF_COMPONENT_UPPER}_LIBRARY)

    IF (MARPAESLIF_ROOT_DIR)
      FIND_LIBRARY (${_MARPAESLIF_LIBRARY_BASE}_DEBUG
	NAMES ${_MARPAESLIF_COMPONENT_POSSIBLE_DEBUG_NAMES}
	PATHS ${MARPAESLIF_ROOT_DIR} PATH_SUFFIXES ${_MARPAESLIF_POSSIBLE_LIB_SUFFIXES}
	# NO_DEFAULT_PATH
	)
      FIND_LIBRARY (${_MARPAESLIF_STATIC_LIBRARY_BASE}_DEBUG
	NAMES ${_MARPAESLIF_STATIC_COMPONENT_POSSIBLE_DEBUG_NAMES}
	PATHS ${MARPAESLIF_ROOT_DIR} PATH_SUFFIXES ${_MARPAESLIF_POSSIBLE_LIB_SUFFIXES}
	# NO_DEFAULT_PATH
	)
    ELSE (MARPAESLIF_ROOT_DIR)
      FIND_LIBRARY (${_MARPAESLIF_LIBRARY_BASE}_DEBUG
	NAMES ${_MARPAESLIF_COMPONENT_POSSIBLE_DEBUG_NAMES}
	PATH_SUFFIXES ${_MARPAESLIF_POSSIBLE_LIB_SUFFIXES}
	)
      FIND_LIBRARY (${_MARPAESLIF_STATIC_LIBRARY_BASE}_DEBUG
	NAMES ${_MARPAESLIF_COMPONENT_STATIC_POSSIBLE_DEBUG_NAMES}
	PATH_SUFFIXES ${_MARPAESLIF_POSSIBLE_LIB_SUFFIXES}
	)
    ENDIF (MARPAESLIF_ROOT_DIR)

    IF (MARPAESLIF_ROOT_DIR)
      FIND_LIBRARY (${_MARPAESLIF_LIBRARY_BASE}_RELEASE
	NAMES ${_MARPAESLIF_COMPONENT_POSSIBLE_RELEASE_NAMES}
	PATHS ${MARPAESLIF_ROOT_DIR} PATH_SUFFIXES ${_MARPAESLIF_POSSIBLE_LIB_SUFFIXES}
	# NO_DEFAULT_PATH
	)
      FIND_LIBRARY (${_MARPAESLIF_STATIC_LIBRARY_BASE}_RELEASE
	NAMES ${_MARPAESLIF_STATIC_COMPONENT_POSSIBLE_RELEASE_NAMES}
	PATHS ${MARPAESLIF_ROOT_DIR} PATH_SUFFIXES ${_MARPAESLIF_POSSIBLE_LIB_SUFFIXES}
	# NO_DEFAULT_PATH
	)
    ELSE (ICU_ROOT_DIR)
      FIND_LIBRARY (${_MARPAESLIF_LIBRARY_BASE}_RELEASE
	NAMES ${_MARPAESLIF_COMPONENT_POSSIBLE_RELEASE_NAMES}
	PATH_SUFFIXES ${_MARPAESLIF_POSSIBLE_LIB_SUFFIXES}
	)
      FIND_LIBRARY (${_MARPAESLIF_STATIC_LIBRARY_BASE}_RELEASE
	NAMES ${_MARPAESLIF_STATIC_COMPONENT_POSSIBLE_RELEASE_NAMES}
	PATH_SUFFIXES ${_MARPAESLIF_POSSIBLE_LIB_SUFFIXES}
	)
    ENDIF (MARPAESLIF_ROOT_DIR)

    SET (MARPAESLIF_${_MARPAESLIF_COMPONENT_UPPER}_FOUND TRUE)

    # Debug and release
    IF (${_MARPAESLIF_LIBRARY_BASE}_DEBUG AND ${_MARPAESLIF_LIBRARY_BASE}_RELEASE)
      SET (${_MARPAESLIF_LIBRARY_BASE}
        debug ${${_MARPAESLIF_LIBRARY_BASE}_DEBUG}
        optimized ${${_MARPAESLIF_LIBRARY_BASE}_RELEASE})
      # Debug only
    ELSEIF (${_MARPAESLIF_LIBRARY_BASE}_DEBUG)
      SET (${_MARPAESLIF_LIBRARY_BASE} ${${_MARPAESLIF_LIBRARY_BASE}_DEBUG})
      # Release only
    ELSEIF (${_MARPAESLIF_LIBRARY_BASE}_RELEASE)
      SET (${_MARPAESLIF_LIBRARY_BASE} ${${_MARPAESLIF_LIBRARY_BASE}_RELEASE})
    ELSE (${_MARPAESLIF_LIBRARY_BASE}_DEBUG AND ${_MARPAESLIF_LIBRARY_BASE}_RELEASE)
      # Component missing: record it for a later report
      LIST (APPEND _MARPAESLIF_MISSING_COMPONENTS ${_MARPAESLIF_COMPONENT})
      SET (MARPAESLIF_${__COMPONENT_UPPER}_FOUND FALSE)
    ENDIF (${_MARPAESLIF_LIBRARY_BASE}_DEBUG AND ${_MARPAESLIF_LIBRARY_BASE}_RELEASE)

    IF (${_MARPAESLIF_STATIC_LIBRARY_BASE}_DEBUG AND ${_MARPAESLIF_STATIC_LIBRARY_BASE}_RELEASE)
      SET (${_MARPAESLIF_STATIC_LIBRARY_BASE}
        debug ${${_MARPAESLIF_STATIC_LIBRARY_BASE}_DEBUG}
        optimized ${${_MARPAESLIF_STATIC_LIBRARY_BASE}_RELEASE})
      # Debug only
    ELSEIF (${_MARPAESLIF_STATIC_LIBRARY_BASE}_DEBUG)
      SET (${_MARPAESLIF_STATIC_LIBRARY_BASE} ${${_MARPAESLIF_STATIC_LIBRARY_BASE}_DEBUG})
      # Release only
    ELSEIF (${_MARPAESLIF_STATIC_LIBRARY_BASE}_RELEASE)
      SET (${_MARPAESLIF_STATIC_LIBRARY_BASE} ${${_MARPAESLIF_STATIC_LIBRARY_BASE}_RELEASE})
    ELSE (${_MARPAESLIF_STATIC_LIBRARY_BASE}_DEBUG AND ${_MARPAESLIF_STATIC_LIBRARY_BASE}_RELEASE)
      # Component missing: record it for a later report
      LIST (APPEND _MARPAESLIF_STATIC_MISSING_COMPONENTS ${_MARPAESLIF_COMPONENT})
      SET (MARPAESLIF_STATIC_${__COMPONENT_UPPER}_FOUND FALSE)
    ENDIF (${_MARPAESLIF_STATIC_LIBRARY_BASE}_DEBUG AND ${_MARPAESLIF_STATIC_LIBRARY_BASE}_RELEASE)

    MARK_AS_ADVANCED (${_MARPAESLIF_LIBRARY_BASE}_DEBUG ${_MARPAESLIF_LIBRARY_BASE}_RELEASE)
    MARK_AS_ADVANCED (${_MARPAESLIF_STATIC_LIBRARY_BASE}_DEBUG ${_MARPAESLIF_STATIC_LIBRARY_BASE}_RELEASE)

    # Make sure only libraries that have been actually found are registered
    IF (${_MARPAESLIF_LIBRARY_BASE})
      LIST (APPEND _MARPAESLIF_LIBRARIES ${${_MARPAESLIF_LIBRARY_BASE}})
    ENDIF (${_MARPAESLIF_LIBRARY_BASE})

    IF (${_MARPAESLIF_STATIC_LIBRARY_BASE})
      LIST (APPEND _MARPAESLIF_STATIC_LIBRARIES ${${_MARPAESLIF_STATIC_LIBRARY_BASE}})
    ENDIF (${_MARPAESLIF_STATIC_LIBRARY_BASE})

  ENDFOREACH (_MARPAESLIF_COMPONENT)

  IF (NOT DEFINED _MARPAESLIF_MISSING_COMPONENTS AND NOT DEFINED _MARPAESLIF_STATIC_MISSING_COMPONENTS)
    # Success: all components were found
    SET (MARPAESLIF_INCLUDE_DIRS "${MARPAESLIF_INCLUDE_DIR}")
    SET (MARPAESLIF_LIBRARIES ${_MARPAESLIF_LIBRARIES})
    SET (MARPAESLIF_STATIC_LIBRARIES ${_MARPAESLIF_STATIC_LIBRARIES})
  ELSE ()
    MESSAGE (STATUS "Several MARPAESLIF components were not found:")

    # Display missing components indented, each on a separate line
    FOREACH (_MARPAESLIF_MISSING_COMPONENT ${_MARPAESLIF_MISSING_COMPONENTS})
      MESSAGE (STATUS "  " ${_MARPAESLIF_MISSING_COMPONENT})
    ENDFOREACH ()
    FOREACH (_MARPAESLIF_STATIC_MISSING_COMPONENT ${_MARPAESLIF_STATIC_MISSING_COMPONENTS})
      MESSAGE (STATUS "  " ${_MARPAESLIF_STATIC_MISSING_COMPONENT})
    ENDFOREACH ()
  ENDIF ()

  #
  # Simulate hopefully correct flags based on heuristic discovery
  #
  IF (NOT _MARPAESLIF_C_FLAGS_SHARED)
    SET (_MARPAESLIF_C_FLAGS_SHARED "${CMAKE_SHARED_LIBRARY_C_FLAGS}")
  ENDIF ()

  IF (NOT _MARPAESLIF_CXX_FLAGS_SHARED)
    SET (_MARPAESLIF_CXX_FLAGS_SHARED "${CMAKE_SHARED_LIBRARY_CXX_FLAGS}")
  ENDIF ()

  IF (NOT _MARPAESLIF_LINK_FLAGS)
    SET (_MARPAESLIF_LINK_FLAGS ${MARPAESLIF_LIBRARIES})
  ENDIF ()

  IF (NOT _MARPAESLIF_STATIC_LINK_FLAGS)
    SET (_MARPAESLIF_STATIC_LINK_FLAGS ${MARPAESLIF_STATIC_LIBRARIES})
  ENDIF ()

ENDIF (MARPAESLIF_INCLUDE_DIR)

SET (_MARPAESLIF_LDFLAGS " ")
FOREACH (_marpaESLIF_link_flag ${_MARPAESLIF_LINK_FLAGS})
  SET (_MARPAESLIF_LDFLAGS "${_MARPAESLIF_LDFLAGS} ${_marpaESLIF_link_flag}")
ENDFOREACH ()

SET (_MARPAESLIF_STATIC_LDFLAGS " ")
FOREACH (_marpaESLIF_static_link_flag ${_MARPAESLIF_STATIC_LINK_FLAGS})
  SET (_MARPAESLIF_STATIC_LDFLAGS "${_MARPAESLIF_STATIC_LDFLAGS} ${_marpaESLIF_static_link_flag}")
ENDFOREACH ()

MARK_AS_ADVANCED (MARPAESLIF_ROOT_DIR MARPAESLIF_INCLUDE_DIR)

FIND_PACKAGE_HANDLE_STANDARD_ARGS (MARPAESLIF
  REQUIRED_VARS
  MARPAESLIF_INCLUDE_DIR
  MARPAESLIF_LIBRARIES)

IF (_MARPAESLIF_LINK_FLAGS AND _MARPAESLIF_STATIC_LINK_FLAGS)
  SET (MARPAESLIF_FOUND 1 CACHE STRING "MARPAESLIF is found")
ENDIF ()

SET (MARPAESLIF_C_FLAGS_SHARED    "${_MARPAESLIF_C_FLAGS_SHARED}"    CACHE STRING "C flags when compiling against shared MARPAESLIF")
SET (MARPAESLIF_CXX_FLAGS_SHARED  "${_MARPAESLIF_CXX_FLAGS_SHARED}"  CACHE STRING "C flags when compiling against shared MARPAESLIF")
SET (MARPAESLIF_LINK_FLAGS        "${_MARPAESLIF_LINK_FLAGS}"        CACHE STRING "Linker flags when linking against MARPAESLIF")
SET (MARPAESLIF_LDFLAGS           "${_MARPAESLIF_LDFLAGS}"           CACHE STRING "Stringified version of MARPAESLIF_LINK_FLAGS")
SET (MARPAESLIF_STATIC_LINK_FLAGS "${_MARPAESLIF_STATIC_LINK_FLAGS}" CACHE STRING "Linker flags when linking against static MARPAESLIF")
SET (MARPAESLIF_STATIC_LDFLAGS    "${_MARPAESLIF_STATIC_LDFLAGS}"    CACHE STRING "Stringified version of MARPAESLIF_STATIC_LINK_FLAGS")

IF(MARPAESLIF_FOUND)
  MESSAGE(STATUS "-----------------------------------------")
  MESSAGE(STATUS "Setup MARPAESLIF:")
  MESSAGE(STATUS "")
  MESSAGE(STATUS "           ROOT_DIR: ${MARPAESLIF_ROOT_DIR}")
  MESSAGE(STATUS "     C_FLAGS_SHARED: ${MARPAESLIF_C_FLAGS_SHARED}")
  MESSAGE(STATUS "   CXX_FLAGS_SHARED: ${MARPAESLIF_CXX_FLAGS_SHARED}")
  MESSAGE(STATUS "        INCLUDE_DIR: ${MARPAESLIF_INCLUDE_DIR}")
  MESSAGE(STATUS "          LIBRARIES: ${MARPAESLIF_LIBRARIES}")
  MESSAGE(STATUS "   STATIC LIBRARIES: ${MARPAESLIF_STATIC_LIBRARIES}")
  MESSAGE(STATUS "         LINK_FLAGS: ${MARPAESLIF_LINK_FLAGS}")
  MESSAGE(STATUS "  STATIC LINK_FLAGS: ${MARPAESLIF_STATIC_LINK_FLAGS}")
  MESSAGE(STATUS "            LDFLAGS: ${MARPAESLIF_LDFLAGS}")
  MESSAGE(STATUS "     STATIC LDFLAGS: ${MARPAESLIF_STATIC_LDFLAGS}")
  MESSAGE(STATUS "-----------------------------------------")
ENDIF()

MARK_AS_ADVANCED (
  MARPAESLIF_FOUND
  MARPAESLIF_C_FLAGS_SHARED
  MARPAESLIF_CXX_FLAGS_SHARED
  MARPAESLIF_LINK_FLAGS
  MARPAESLIF_LDFLAGS
  MARPAESLIF_STATIC_LINK_FLAGS
  MARPAESLIF_STATIC_LDFLAGS
  )
