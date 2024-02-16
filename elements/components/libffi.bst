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
  ref: v3.4.5-0-g012fcaf96c87ab617ba34babce9b6b259188fcf0
