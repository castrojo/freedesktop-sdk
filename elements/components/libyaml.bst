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
  ref: 0.2.6-0-gfc96aa689026e314f2177e69a2903ef045aec571
