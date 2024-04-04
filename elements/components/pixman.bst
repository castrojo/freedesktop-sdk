kind: meson

depends:
- filename: bootstrap-import.bst
  type: build
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/libpng.bst
  type: build

variables:
  meson-local: >-
    -Dauto_features=auto

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpixman-1.so'

sources:
- kind: git_repo
  url: freedesktop:pixman/pixman.git
  track: pixman-0.42.*
  ref: pixman-0.42.2-0-g37216a32839f59e8dcaa4c3951b3fcfc3f07852c
