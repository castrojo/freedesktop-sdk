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
  ref: v3.31.10-0-gca626022f51036b22550bce91b2149547645e101
