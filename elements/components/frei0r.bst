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
  ref: v2.3.3-0-gcdeddc7553bbfdc446c61d1bfa6a51bcc029b4a8
