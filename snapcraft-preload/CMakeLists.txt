# -*- Mode: CMake; indent-tabs-mode: nil; tab-width: 4 -*-
#
# Copyright (C) 2015-2016 Canonical, Ltd.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 3.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

cmake_minimum_required(VERSION 3.2)

if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "Release" CACHE STRING "" FORCE)
endif(NOT CMAKE_BUILD_TYPE)

set(SNAPCRAFT_PRELOAD "snapcraft-preload")
set(LIBNAME "lib${SNAPCRAFT_PRELOAD}")
set(LIBPATH "lib")
add_library(${SNAPCRAFT_PRELOAD} SHARED preload.cpp)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14")

set_target_properties(${SNAPCRAFT_PRELOAD} PROPERTIES
                      COMPILE_FLAGS "-DSNAPCRAFT_LIBNAME_DEF=\\\"${LIBNAME}.so\\\"")
target_link_libraries(${SNAPCRAFT_PRELOAD} -ldl)

execute_process(COMMAND uname -m COMMAND tr -d '\n' OUTPUT_VARIABLE ARCHITECTURE)
if(${ARCHITECTURE} STREQUAL "x86_64")
    add_library("${SNAPCRAFT_PRELOAD}32" SHARED preload.cpp)
    set_target_properties("${SNAPCRAFT_PRELOAD}32" PROPERTIES
                          COMPILE_FLAGS "-DSNAPCRAFT_LIBNAME_DEF=\\\"${LIBNAME}32.so\\\" -m32")
    target_link_libraries("${SNAPCRAFT_PRELOAD}32" -ldl -m32)
endif()

configure_file(snapcraft-preload.in snapcraft-preload @ONLY)

install(TARGETS ${SNAPCRAFT_PRELOAD} LIBRARY DESTINATION ${LIBPATH})
install(PROGRAMS ${CMAKE_CURRENT_BINARY_DIR}/snapcraft-preload DESTINATION bin)
