kind: distutils

depends:
- bootstrap-import.bst
- components/python3.bst
- components/util-linux.bst

sources:
- kind: pypi
  name: setuptools
  ref:
    sha256sum: 00478ca80aeebeecb2f288d3206b0de568df5cd2b8fada1209843cc9a8d88a48
    suffix: ac/e0/4ccbb616e5f30d3595fa44ccc66ba5ac38e68885bcd888916d39f8ba480a/setuptools-68.2.0.tar.gz
