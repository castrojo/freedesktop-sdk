kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-hatchling.bst
- components/python3-hatch-vcs.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: filelock
  ref:
    sha256sum: 81de9eb8453c769b63369f87f11131a7ab04e367f8d97ad39dc230daa07e3bec
    suffix: 
      e6/76/3981447fd369539aba35797db99a8e2ff7ed01d9aa63e9344a31658b8d81/filelock-3.16.0.tar.gz
