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
  ref: 5.3-0-g5b73b25bd632a0556b04787fb230cf7d1f13b04e
