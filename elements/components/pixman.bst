kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst

variables:
  meson-local: >-
    -Dtests=disabled
    -Ddemos=disabled
    -Dauto_features=auto
    -Drvv=disabled

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpixman-1.so'

sources:
- kind: git_repo
  url: freedesktop:pixman/pixman.git
  ref: pixman-0.44.2-0-g46655e15671e1ca62d699821d75a85d341d7229c
