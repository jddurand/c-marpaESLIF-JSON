MACRO (MYPACKAGEADDEXECUTABLESTOTESTS)
  FOREACH (_target ${ARGV})
    LIST (APPEND ${PROJECT_NAME}_TEST_EXECUTABLE ${_target})
    LIST (APPEND ${PROJECT_NAME}_TEST_EXECUTABLE ${_target}_static)
  ENDFOREACH ()
ENDMACRO ()

