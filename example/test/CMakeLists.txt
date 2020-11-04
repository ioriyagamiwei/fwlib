# add googletest
add_subdirectory("${PROJECT_SOURCE_DIR}/extern/googletest" "extern/googletest")

# cache cleanliness
mark_as_advanced(
    BUILD_GMOCK BUILD_GTEST BUILD_SHARED_LIBS
    gmock_build_tests gtest_build_samples gtest_build_tests
    gtest_disable_pthreads gtest_force_shared_crt gtest_hide_internal_symbols
)

macro(package_add_test TESTNAME FILES LIBRARIES)
    add_executable(${TESTNAME} ${FILES})

    # not required for googletest
    #add_test(NAME ${TESTNAME} COMMAND ${TESTNAME})
    #target_link_libraries(${TESTNAME} config)

    target_link_libraries(${TESTNAME} gtest gmock gtest_main ${LIBRARIES})
    gtest_discover_tests(${TESTNAME})
    #gtest_discover_tests(${TESTNAME}
    #      WORKING_DIRECTORY "${PROJECT_DIR}/test"
    #      PROPERTIES VS_DEBUGGER_WORKING_DIRECTORY "${PROJECT_DIR}/test"
    #  )
    set_target_properties(${TESTNAME} PROPERTIES FOLDER test)
endmacro()

package_add_test(test_config test_config.cpp config)

#add_executable(test_config test_config.c)
#add_test(NAME test_config COMMAND test_config)
