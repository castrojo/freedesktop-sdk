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
    sha256sum: 918b5633eddf6b41c32d4f454bf0de810065c74e3f7dbf8ee5452f8be88d3e96
    suffix: 9b/98/518d8e5081007684232226f475082b30087d0f585e8457db087298259f49/click-8.4.1.tar.gz
