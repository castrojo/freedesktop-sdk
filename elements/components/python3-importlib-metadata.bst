kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst
- components/python3-zipp.bst

sources:
- kind: pypi
  name: importlib-metadata
  ref:
    sha256sum: 9127aad2f49d7203e7112098c12b92e4fd1061ccd18548cdfdc49171a8c073cc
    suffix: 3f/24/69442c79335591a2dfe3c9b796ae79348c49bc50c8f2886063d1b0e1e5f3/importlib_metadata-6.2.0.tar.gz
