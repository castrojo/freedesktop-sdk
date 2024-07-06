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
    ../configure --prefix=%{prefix} --docdir=/share/doc/cmake

sources:
- kind: git_repo
  url: kitware:cmake.git
  track: v*
  exclude:
  - v*-rc*
  ref: v3.29.6-0-gcdc901797ac4ce0d1feeec454ecdd29e8ef5d4ff
