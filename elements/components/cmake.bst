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
  ref: v3.29.4-0-gefaa9efece0786a80243d005e35e68f18999eb0e
- kind: patch
  path: patches/cmake/cmake-nolib64.patch
