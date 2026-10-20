kind: cmake
description: Tool to record execution of a program and later replay it in a debugger.

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/capnproto.bst

depends:
- public-stacks/runtime-minimal.bst
- components/zstd.bst
- components/zlib.bst
- components/python3.bst

variables:
  cmake-local: >-
    -Ddisable32bit=ON
    -DBUILD_TESTS=OFF

config:
  install-commands:
    (>):
    - |
      mkdir -p %{install-root}%{indep-libdir}/rr
      mv %{install-root}%{libdir}/rr/librr*so %{install-root}%{indep-libdir}/rr/
      rmdir -v %{install-root}%{libdir}/rr %{install-root}%{libdir}

sources:
- kind: git_repo
  url: github:mozilla/rr.git
  track: '*.*.*'
  ref: 5.10.0-0-g7c5a08e538e7999bf996f60a8c206e122f4b8050
- kind: patch
  path: patches/rr/drop_termio_check.patch
