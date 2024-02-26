kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- components/cairo.bst
- components/python3.bst

sources:
- kind: git_repo
  url: github:pygobject/pycairo.git
  track: v*
  ref-format: git-describe
  ref: v1.26.0-0-g1ef6ff7fa0ddaf2e13d928ce3c5dc2ad3fa89621
