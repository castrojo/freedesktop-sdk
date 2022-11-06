kind: autotools
description: libffi

build-depends:
- components/autoconf2.69.bst
- components/texinfo.bst
- public-stacks/buildsystem-autotools.bst

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
  autogen: autoreconf2.69 -fvi

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

sources:
- kind: git_tag
  url: github:libffi/libffi.git
  ref: v3.3-0-g5dcb741f1544c5e18c9dbf96aeb8b61cc556a616
