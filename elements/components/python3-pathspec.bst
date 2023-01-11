kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: pathspec
  ref:
    sha256sum: 56200de4077d9d0791465aa9095a01d421861e405b5096955051deefd697d6f6
    suffix: 32/1a/6baf904503c3e943cae9605c9c88a43b964dea5b59785cf956091b341b08/pathspec-0.10.3.tar.gz
