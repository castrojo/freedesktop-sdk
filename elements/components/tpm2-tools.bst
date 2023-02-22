kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/git-minimal.bst

depends:
- components/tpm2-tss.bst

sources:
- kind: git_tag
  url: github:tpm2-software/tpm2-tools.git
  track: master
  exclude:
  - '*rc*'
  ref: 5.5-0-g7ef8b4c3f2b4b7981df07798477d376e420f606a
