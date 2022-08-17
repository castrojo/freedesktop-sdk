kind: autotools

depends:
- bootstrap-import.bst
- components/openssl.bst

variables:
  conf-args: --prefix=%{prefix}

config:
  configure-commands:
    (<):
    - |
      echo 'list(INSERT CMAKE_SYSTEM_LIBRARY_PATH 0 "%{libdir}")' >>Modules/Platform/UnixPaths.cmake
      echo 'list(INSERT CMAKE_PLATFORM_IMPLICIT_LINK_DIRECTORIES 0 "%{libdir}")' >>Modules/Platform/UnixPaths.cmake

sources:
- kind: git_tag
  url: kitware:cmake.git
  track: master
  exclude:
  - v*-rc*
  ref: v3.24.0-0-g4be24f031a4829db75b85062cc67125035d8831e
- kind: patch
  path: patches/cmake/cmake-nolib64.patch
