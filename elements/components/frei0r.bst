kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build
- filename: components/cairo.bst

sources:
- kind: git_repo
  url: github:dyne/frei0r.git
  track: v*
  ref: v2.5.4-0-gfc9320063a0ae3f0e14b0ba408d71ca03db5b54f
