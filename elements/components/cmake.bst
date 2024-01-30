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
  track: v*
  exclude:
  - v*-rc*
  ref: v3.28.2-0-g1f25aa1a0ac61a0b3d5b0c4e2abc98c49cd159a5
- kind: patch
  path: patches/cmake/cmake-nolib64.patch
