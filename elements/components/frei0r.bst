kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build
- filename: components/cairo.bst

sources:
- kind: git_tag
  url: github:dyne/frei0r.git
  track: master
  ref: v1.9.5-0-g3eb442ff9df97b6af9590b2ec6d5c8707f0de973
