kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: calver
  ref:
    sha256sum: e05493a3b17517ef1748fbe610da11f10485faa7c416b9d33fd4a52d74894f8b
    suffix: b5/00/96cbed7c019c49ee04b8a08357a981983db7698ae6de402e57097cefc9ad/calver-2022.6.26.tar.gz
