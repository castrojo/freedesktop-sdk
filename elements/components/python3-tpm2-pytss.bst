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
    sha256sum: 5b5b4b1456fdc1aeef3d2c3970beaa078c8f7f2648c97a69bcf60c5a2f95c897
    suffix: 0f/e7/1680ec28f41196fb8adc0a2b2dc1e16d383b25446402dc83d158f3191d8b/tpm2-pytss-2.1.0.tar.gz
- kind: patch_queue
  path: patches/tpm2-ptyss
