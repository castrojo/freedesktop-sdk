kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- components/cairo.bst
- components/python3.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{indep-libdir}/python*/site-packages/*/include'
        - '%{indep-libdir}/python*/site-packages/*/include/**'

sources:
- kind: git_repo
  url: github:pygobject/pycairo.git
  track: v*
  ref-format: git-describe
  ref: v1.29.1-0-g08960e57e952f5b4651e67f8c2680137f8724cd2
