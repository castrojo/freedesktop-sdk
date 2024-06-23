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
  ref: v1.26.1-0-g49c89e21c9f11006d37841f920af060cc7d70999
