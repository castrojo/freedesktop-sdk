kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-decorator.bst # This should be gone with 2.6 update

sources:
- kind: pypi
  name: networkx
  include:
  - '2.5'
  ref:
    sha256sum: 109cd585cac41297f71103c3c42ac6ef7379f29788eb54cb751be5a663bb235a
    suffix: b0/21/adfbf6168631e28577e4af9eb9f26d75fe72b2bb1d33762a5f2c425e6c2a/networkx-2.5.1.tar.gz
