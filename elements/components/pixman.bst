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
  ref: pixman-0.46.4-0-g9cc163c9da0fb4da430641715313d95a6ec466d9
