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
  track: pixman-*
  ref: pixman-0.43.2-0-g91b8526c1eeb2b45c21f091e890cb74cf6989ff6
