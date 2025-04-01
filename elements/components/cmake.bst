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
    ../configure --prefix=%{prefix} --docdir=/share/doc/cmake --verbose

sources:
- kind: git_repo
  url: kitware:cmake.git
  track: v3.*
  exclude:
  - v*-rc*
  ref: v3.31.6-0-g859ca5c4d7396a011a462878179bc173e1283731
