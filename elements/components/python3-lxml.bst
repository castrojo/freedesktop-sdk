kind: pip

build-depends:
- components/cython.bst
- components/python3-pip.bst

depends:
- components/libxml2.bst
- components/libxslt.bst
- components/python3.bst

sources:
- kind: pypi
  name: lxml
  ref:
    sha256sum: 42a8aa957e98bd8b884a8142175ec24ce4ef0a57760e8879f193bfe64b757ca9
    suffix: 
      73/a6/0730ff6cbb87e42e1329a486fe4ccbd3f8f728cb629c2671b0d093a85918/lxml-5.1.1.tar.gz
