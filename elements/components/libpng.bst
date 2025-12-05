kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/libpng-config'
        - '%{bindir}/libpng16-config'
        - '%{libdir}/libpng.so'
        - '%{libdir}/libpng16.so'

sources:
- kind: git_repo
  url: github:glennrp/libpng.git
  track: v*
  exclude:
  - v*alpha*
  - v*beta*
  ref: v1.6.52-0-gfbed16182b92eeb3a06d96e49f0836d450318098
