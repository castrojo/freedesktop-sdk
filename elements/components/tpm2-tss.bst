kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/doxygen.bst
- components/git-minimal.bst
- components/systemd-stage1.bst

depends:
- components/libgcrypt.bst
- components/json-c.bst
- components/curl.bst
- components/openssl.bst

sources:
- kind: git_tag
  url: github:tpm2-software/tpm2-tss.git
  track: master
  track-extra:
  - 3.2.x
  exclude:
  - '*rc*'
  ref: 4.0.0-0-gb827242c15f6343f385eb7e075c9e74096cbb4d6
- kind: patch
  path: patches/tpm2-tss/conditionally-check-for-user-group-manipulation-commands.patch
- kind: patch
  path: patches/tpm2-tss/prevent-dirty-version.patch
