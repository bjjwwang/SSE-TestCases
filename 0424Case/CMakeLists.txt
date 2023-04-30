cmake_minimum_required(VERSION 3.10)
enable_testing()
include(CTest)
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Debug)
endif()
MESSAGE("CTest Enabled")
set(SSE_TEST_CATEGORIES dirty function general )
set(OVERFLOW_TEST_CATEGORIES dirty function general )
set(SSE /Users/jiaweiwang/CLionProjects/0130-db/svf-z3/cmake-build-debug/bin/sse)
FOREACH(TEST_CATEGORY ${OVERFLOW_TEST_CATEGORIES})
    file(GLOB BC_FILE ${CMAKE_CURRENT_SOURCE_DIR}/testcase_bc/${TEST_CATEGORY}/*.ll)
    FOREACH(TEST ${BC_FILE})
        MESSAGE(${TEST})
        STRING(REGEX REPLACE ".ll" "" N ${TEST})
        add_test(
                NAME ${N}-overflow
                COMMAND ${SSE} -overflow -dump-es-table=${N}-overflow.log -log-level=debug -stat -valid-tests ${TEST}
                WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
        )
        set_tests_properties(${N}-overflow PROPERTIES PASS_REGULAR_EXPRESSION "1")
    ENDFOREACH()
ENDFOREACH()