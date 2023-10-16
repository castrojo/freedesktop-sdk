kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3-setuptools.bst
- components/jpeg.bst

sources:
- kind: pypi
  name: Pillow
  ref:
    sha256sum: e6bf8de6c36ed96c86ea3b6e1d5273c53f46ef518a062464cd7ef5dd2cf92e38
    suffix: 80/d7/c4b258c9098b469c4a4e77b0a99b5f4fd21e359c2e486c977d231f52fc71/Pillow-10.1.0.tar.gz
