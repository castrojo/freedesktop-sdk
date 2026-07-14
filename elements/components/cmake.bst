# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: cmake

(@):
- elements/include/cmake-source.yml

build-depends:
- components/_private/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst
- components/curl.bst
- components/expat.bst
- components/libarchive.bst
- components/openssl.bst

variables:
  cmake-local: >-
    -DCMAKE_USE_SYSTEM_LIBRARIES=ON
    -DCMAKE_USE_SYSTEM_LIBRARY_CPPDAP=OFF
    -DCMAKE_USE_SYSTEM_LIBRARY_LIBRHASH=OFF
    -DCMAKE_USE_SYSTEM_LIBRARY_LIBUV=OFF
    -DCMAKE_USE_SYSTEM_LIBRARY_JSONCPP=OFF

config:
  configure-commands:
    (<):
    - |
      echo 'list(INSERT CMAKE_SYSTEM_LIBRARY_PATH 0 "%{libdir}")' >>Modules/Platform/UnixPaths.cmake
      echo 'list(INSERT CMAKE_PLATFORM_IMPLICIT_LINK_DIRECTORIES 0 "%{libdir}")' >>Modules/Platform/UnixPaths.cmake
