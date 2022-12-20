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
  ref: v2.2.0-0-g6cb9759e901f1c5b0ce843ca9d5bd2031df039f3
