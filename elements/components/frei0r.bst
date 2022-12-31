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
  ref: v2.0.0-0-gade083a86797b4366f070b48fd7a73b90c8e5234
