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
  ref: v1.25.0-0-g5835e4cd3478aa5187ca704bfedcd002c49bb05d
