# Copyright (c) 2018 Shapelets.io
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# git support
INCLUDE(GetGitRevisionDescription)

# get current version from git tags
git_describe(VERSION --tags --dirty=-dirty)

# parse the version information into pieces.
STRING(REGEX REPLACE "^v([0-9]+)\\..*" "\\1" VERSION_MAJOR "${VERSION}")
STRING(REGEX REPLACE "^v[0-9]+\\.([0-9]+).*" "\\1" VERSION_MINOR "${VERSION}")
STRING(REGEX REPLACE "^v[0-9]+\\.[0-9]+\\.([0-9]+).*" "\\1" VERSION_PATCH "${VERSION}")
STRING(REGEX REPLACE "^v[0-9]+\\.[0-9]+\\.[0-9]+(.*)" "\\1" VERSION_SHA1 "${VERSION}")
SET(VERSION_SHORT "${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_PATCH}")

# dump version information down to a header file
CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/include/khiva/version.h.in
               ${CMAKE_CURRENT_SOURCE_DIR}/include/khiva/version.h)

# dump version to the version test file
CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/test/versionTest.cpp.in
               ${CMAKE_CURRENT_SOURCE_DIR}/test/versionTest.cpp)