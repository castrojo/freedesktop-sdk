kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-hatchling.bst
- components/python3-hatch-vcs.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-appdirs.bst
- components/python3-distlib.bst
- components/python3-filelock.bst
- components/python3-six.bst
- components/python3-importlib-metadata.bst
- components/python3-importlib-resources.bst
- components/python3-pathlib2.bst

sources:
- kind: pypi
  name: virtualenv
  ref:
    sha256sum: 2ef6a237c31629da6442b0bcaa3999748108c7166318d1f55cc9f8d7294e97bd
    suffix: 7c/08/cc69e4b3d499ee9570c4c57f23d5e71ed814fcf03988a4edd3081cb74577/virtualenv-20.24.1.tar.gz
