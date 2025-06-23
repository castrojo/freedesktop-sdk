kind: autotools

(@):
- include/_private/autotools-recc.yml

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/_private/git-minimal.bst
- (@): include/_private/gcc-for-recc.yml

depends:
- components/tpm2-tss.bst

variables:
  local_flags: >-
    -Wno-error

sources:
- kind: git_repo
  url: github:tpm2-software/tpm2-tools.git
  track: '*.*'
  exclude:
  - '*rc*'
  ref: 5.7-0-gc6e182cf690ca0022b77fe7d3c174659917a7e7e
- kind: patch
  path: patches/tpm2-tools/fix-hardening-flags.patch
