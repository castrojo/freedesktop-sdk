kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/pkg-config.bst
- components/python3-pkgconfig.bst
- components/python3-pycparser.bst
- components/python3-setuptools-scm.bst
- components/tpm2-tss.bst

depends:
- components/python3.bst
- components/python3-cffi.bst
- components/python3-cryptography.bst
- components/python3-packaging.bst
- components/python3-asn1crypto.bst

sources:
- kind: pypi
  name: tpm2-pytss
  ref:
    sha256sum: b8f15473422f377f59c7217dcd1479165cce62dfa33934ec976a278baf2e9efe
    suffix: 
      13/e5/8d4a9ac91579c741ec9fb63befcf6577107f22f3508c364fd53e277d7237/tpm2-pytss-2.2.1.tar.gz
