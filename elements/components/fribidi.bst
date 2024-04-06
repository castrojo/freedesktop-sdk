kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst

variables:
  meson-local: >-
    -Ddocs=false

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libfribidi.so'

sources:
- kind: git_repo
  url: github:fribidi/fribidi.git
  ref: v1.0.12-0-g6428d8469e536bcbb6e12c7b79ba6659371c435a
