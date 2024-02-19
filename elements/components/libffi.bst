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
        - '%{libdir}/libffi-3.2.1/include'
        - '%{libdir}/libffi-3.2.1/include/**'

variables:
  conf-local: >-
    --without-gcc-arch

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

sources:
- kind: git_tag
  url: github:libffi/libffi.git
  track: master
  exclude:
  - v*-rc*
  ref: v3.4.6-0-g3d0ce1e6fcf19f853894862abcbac0ae78a7be60
