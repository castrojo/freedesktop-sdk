kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst
- components/cairo.bst

sources:
- kind: git_repo
  url: github:dyne/frei0r.git
  track: v*
  ref: v2.5.1-0-gf081aa64d4fb99fb1f16dce7dff8d6a989794afa
