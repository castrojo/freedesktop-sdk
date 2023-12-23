kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython.bst

depends:
- components/libxml2.bst
- components/libxslt.bst
- components/python3.bst

sources:
- kind: pypi
  name: lxml
  ref:
    sha256sum: b1541e50b78e15fa06a2670157a1962ef06591d4c998b998047fff5e3236880e
    suffix: 
      84/14/c2070b5e37c650198de8328467dd3d1681e80986f81ba0fea04fc4ec9883/lxml-4.9.4.tar.gz
