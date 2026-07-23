kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/git-minimal.bst

depends:
- components/tpm2-tss.bst

sources:
- kind: git_repo
  url: github:tpm2-software/tpm2-tools.git
  track: '*.*'
  exclude:
  - '*rc*'
  ref: 5.8-0-gbc25f7149372002d4d595195b2d09a1a6d18bca1
