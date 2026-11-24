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
        - '%{libdir}/libyaml.so'

sources:
- kind: git_repo
  url: github:yaml/libyaml.git
  track: '*.*.*'
  exclude:
  - "*rc*"
  ref: 0.2.7-0-g1ebd83d894d4fc476a23977e85a2164c28aadf6b
