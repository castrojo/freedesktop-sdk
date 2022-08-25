kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: contextlib2
  ref:
    sha256sum: ab1e2bfe1d01d968e1b7e8d9023bc51ef3509bba217bb730cee3827e1ee82869
    suffix: c7/13/37ea7805ae3057992e96ecb1cffa2fa35c2ef4498543b846f90dd2348d8f/contextlib2-21.6.0.tar.gz
