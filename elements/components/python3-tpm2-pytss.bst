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
    sha256sum: 20071129379656f5f3c3bc16d364612672b147d81191fb4eb9f9ff9fbee48410
    suffix: 
      07/1f/0f2521440e330342ef757a6605b61e1dbf5fe47fd97397c6e5f02791d520/tpm2-pytss-2.3.0.tar.gz
