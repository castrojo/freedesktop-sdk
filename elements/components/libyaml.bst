kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: github:yaml/libyaml.git
  track: '*.*.*'
  ref: 0.2.5-0-g2c891fc7a770e8ba2fec34fc6b545c672beb37e6
