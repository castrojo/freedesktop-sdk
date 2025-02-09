kind: autotools
description: libffi

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/texinfo.bst

depends:
- bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libffi.so'

variables:
  conf-local: >-
    --without-gcc-arch

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

sources:
- kind: git_repo
  url: github:libffi/libffi.git
  track: v*
  exclude:
  - v*-rc*
  ref: v3.4.7-0-g1716f81e9a115d340429504563bc8e7fb2eeef2b
