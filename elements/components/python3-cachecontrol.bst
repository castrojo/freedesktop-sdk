kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: cachecontrol
  ref:
    sha256sum: 06ef916a1e4eb7dba9948cdfc9c76e749db2e02104a9a1277e8b642591a0f717
    suffix: 
      d2/23/db12e0b6b241e33f77f7cce01a06b4cc6f8071728656cc0ea262d2a14dad/cachecontrol-0.14.1.tar.gz
