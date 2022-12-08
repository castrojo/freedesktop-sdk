kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
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
    sha256sum: 3a05964e3723dd0778752682c18f9fb914292d2167e3ef68d7590f47d9fc6b9e
    suffix: b8/ac/35e2e7cd75f1a5a79a28207cde23d08850f0a700512e6144c0ce916cb648/tpm2-pytss-1.2.0.tar.gz
