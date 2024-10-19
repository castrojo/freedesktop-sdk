kind: manual

build-depends:
- components/gcc.bst
- components/ninja.bst

depends:
- bootstrap-import.bst
- components/curl.bst
- components/expat.bst
- components/libarchive.bst
- components/openssl.bst

environment:
  JOBS: "%{max-jobs}"

environment-nocache:
- JOBS

variables:
  bootstrap-flags: >-
    --prefix=%{prefix}
    --docdir=/share/doc/cmake
    --generator=Ninja
    --verbose
    --system-libs
    --no-system-cppdap
    --no-system-librhash
    --no-system-libuv
    --no-system-jsoncpp
    --parallel=${JOBS}

  build-dir: _build_dir

config:
  configure-commands:
  - |
    echo 'list(INSERT CMAKE_SYSTEM_LIBRARY_PATH 0 "%{libdir}")' >>Modules/Platform/UnixPaths.cmake
    echo 'list(INSERT CMAKE_PLATFORM_IMPLICIT_LINK_DIRECTORIES 0 "%{libdir}")' >>Modules/Platform/UnixPaths.cmake

  - |
    mkdir %{build-dir}
    cd %{build-dir}
    ../bootstrap %{bootstrap-flags}

  build-commands:
  - |
    ninja -v -j ${JOBS} -C %{build-dir}

  install-commands:
  - |
    env DESTDIR="%{install-root}" ninja install -v -j ${JOBS} -C %{build-dir}

sources:
- kind: git_repo
  url: kitware:cmake.git
  track: v*
  exclude:
  - v*-rc*
  ref: v3.30.5-0-g9c4a0a9ff09735b847bbbc38caf6da7f6c7238f2
