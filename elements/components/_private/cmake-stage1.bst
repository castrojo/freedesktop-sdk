# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

(@):
- elements/include/cmake-source.yml

build-depends:
- bootstrap/grep.bst
- bootstrap/sed.bst
- components/gcc.bst
- components/ninja.bst
- components/stripper.bst

depends:
- public-stacks/runtime-minimal.bst
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
    --no-debugger

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

  - |
    %{install-extra}
