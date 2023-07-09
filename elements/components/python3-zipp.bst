kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: zipp
  ref:
    sha256sum: 1876cb065531855bbe83b6c489dcf69ecc28f1068d8e95959fe8bbc77774c941
    suffix: 52/9a/d93b483b9a744e7f71b311ee9bb5a228f6846219ceb5d6dbcb3eddcd1932/zipp-3.16.0.tar.gz
