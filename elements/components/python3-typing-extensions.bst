kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-flit-core.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: typing-extensions
  ref:
    sha256sum: ff6b238610c747e44c268aa4bb23c8c735d665a63726df3f9431ce707f2aa768
    suffix: e4/03/4670b4c206e1dc869f2f0120c3d0a2b17d42526ab2b5a8f66d4cd8642ef3/typing_extensions-4.6.0.tar.gz
