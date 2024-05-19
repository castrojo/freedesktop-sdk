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
- kind: git_repo
  url: github:tpm2-software/tpm2-tss.git
  track: '3.*.*'
  exclude:
  - '*rc*'
  ref: 3.2.3-0-g89fa17305d54df42252c29d95c2a3635121ba2ee
- kind: patch
  path: patches/tpm2-tss/conditionally-check-for-user-group-manipulation-commands.patch
- kind: patch
  path: patches/tpm2-tss/prevent-dirty-version.patch
