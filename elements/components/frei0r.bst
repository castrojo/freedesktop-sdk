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
  ref: v1.10.0-0-g28ed1548ee37f93913c92b79c84ffb89a296d946
