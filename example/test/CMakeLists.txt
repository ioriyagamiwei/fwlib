
macro(package_add_test TESTNAME FILES LIBRARIES)
    add_executable(${TESTNAME} ${FILES})

    add_test(NAME ${TESTNAME} COMMAND ${TESTNAME} WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}/test")
    target_link_libraries(${TESTNAME} ${LIBRARIES})
endmacro()

package_add_test(test_config test_config.c config)
