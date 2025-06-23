kind: cmake
description: Tool to record execution of a program and later replay it in a debugger.

(@):
- include/_private/cmake-recc.yml

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/capnproto.bst
- (@): include/_private/gcc-for-recc.yml

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
  ref: 5.9.0-0-gaaed29dc0324444e36503a26dcec96731d1942b0
- kind: patch
  path: patches/rr/drop_termio_check.patch
