kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/libpng.bst

depends:
- bootstrap-import.bst

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
