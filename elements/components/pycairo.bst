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
  ref: v1.27.0-0-g0a5d483cb636beb678f78287a5e0095222d47988
