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
  ref: v1.6.54-0-g02f2b4f4699f0ef9111a6534f093b53732df4452
