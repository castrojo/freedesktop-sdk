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
  ref: 5.6-0-ga36f8e29bcac44097d1848a014526de9572e5810
