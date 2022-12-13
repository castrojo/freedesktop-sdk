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
    sha256sum: 88de5e3ca327621d55cc66cab70748c75b46ef84fef1ac7f02a0c681eae6afdd
    suffix: d5/75/b3f17e8b351377df68d0fe8b5b991ed94f82b6c2a791cee5c4315ce4daf7/tpm2-pytss-2.0.0.tar.gz
