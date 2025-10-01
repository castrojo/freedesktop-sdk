kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/git-minimal.bst
- components/python3-pkcs11.bst

depends:
- components/libyaml.bst
- components/python3.bst
- components/python3-cryptography.bst
- components/python3-pyasn1.bst
- components/python3-pyasn1-modules.bst
- components/python3-pyyaml.bst
- components/python3-tpm2-pytss.bst
- components/tpm2-tools.bst
- components/sqlite.bst

sources:
- kind: git_repo
  url: github:tpm2-software/tpm2-pkcs11.git
  track: '*.*.*'
  exclude:
  - '*rc*'
  ref: 1.9.2-0-gb95c802d588295e12db7caee805bfb54595c6845
