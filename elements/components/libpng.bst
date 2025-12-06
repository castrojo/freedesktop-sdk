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
  ref: v1.6.53-0-g4e3f57d50f552841550a36eabbb3fbcecacb7750
