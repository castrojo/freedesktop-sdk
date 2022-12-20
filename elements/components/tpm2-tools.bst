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
  ref: 5.4-0-g137ab2a46004da03652ab410178670c25cfe090c
