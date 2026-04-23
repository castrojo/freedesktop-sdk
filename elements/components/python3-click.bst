kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

variables:
  strip-binaries: ''

sources:
# Upstream retags git tags
- kind: pypi
  name: click
  include:
  - "8.*"
  exclude:
  - "8.2.2"
  ref:
    sha256sum: 398329ad4837b2ff7cbe1dd166a4c0f8900c3ca3a218de04466f38f6497f18a2
    suffix: bb/63/f9e1ea081ce35720d8b92acde70daaedace594dc93b693c869e0d5910718/click-8.3.3.tar.gz
