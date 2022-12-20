kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/git-minimal.bst

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
  ref: 1.9.0-0-g61056b9028ea7bef7d721906cc3102a414d99f06
