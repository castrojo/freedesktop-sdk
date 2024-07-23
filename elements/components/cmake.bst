kind: autotools

depends:
- bootstrap-import.bst
- components/openssl.bst

config:
  configure-commands:
  - |
    echo 'list(INSERT CMAKE_SYSTEM_LIBRARY_PATH 0 "%{libdir}")' >>Modules/Platform/UnixPaths.cmake
    echo 'list(INSERT CMAKE_PLATFORM_IMPLICIT_LINK_DIRECTORIES 0 "%{libdir}")' >>Modules/Platform/UnixPaths.cmake

  - |
    mkdir %{build-dir}
    cd %{build-dir}
    ../configure --prefix=%{prefix}

sources:
- kind: git_repo
  url: kitware:cmake.git
  track: v3.29.*
  exclude:
  - v*-rc*
  ref: v3.29.7-0-g928571f3c25637ed7d38fb100b3966ce1e2ab51f
- kind: patch
  path: patches/cmake/cmake-nolib64.patch
