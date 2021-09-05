# swisseph CMakeLists.txt

cmake_minimum_required( VERSION 3.10 )
project( cswisseph )

message( STATUS "-- Configuring cswisseph..." )

set( SOURCES
    swecl.c
    swedate.c
    swehel.c
    swehouse.c
    swejpl.c
    swemmoon.c
    swemplan.c
    #swemptab.c
    sweph.c
    swephlib.c
    )

set( HEADERS
    swedate.h
    swedll.h
    swehouse.h
    swejpl.h
    swemptab.h
    swenut2000a.h
    sweodef.h
    sweph.h
    swephexp.h
    swephlib.h
    )

include_directories( BEFORE . )

if ( MSVC )
    add_definitions( -D_CRT_SECURE_NO_WARNINGS )
else()
    add_definitions( -g -O9 -Wall )
    if ( NOT MINGW )
        add_definitions( -fPIC )
    endif()
endif()

add_library( swe STATIC ${SOURCES} )

install( TARGETS swe ARCHIVE DESTINATION lib )
install( FILES ${HEADERS} DESTINATION include/swisseph )

# export some variables
set( LIBSWE_INCLUDE_PATH ${CMAKE_CURRENT_SOURCE_DIR}
    CACHE STRING "Path to swisseph header files" )

# build some executable
if ( EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/mytest.c" )
    add_executable( mytest mytest.c )
    target_link_libraries( mytest swe )
    if ( NOT MSVC )
        target_link_libraries( mytest m dl )
    endif()
endif()

# vi: ai et sw=4 ts=4 sts=4
