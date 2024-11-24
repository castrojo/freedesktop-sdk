kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- public-stacks/runtime-minimal.bst

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
  track: pixman-*
  ref: pixman-0.44.0-0-gae6646f1594b94ff781186ba744d89fefe16778f
