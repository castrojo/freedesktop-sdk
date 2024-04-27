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
  ref: 5.7-0-gc6e182cf690ca0022b77fe7d3c174659917a7e7e
