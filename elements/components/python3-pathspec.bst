kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: pathspec
  ref:
    sha256sum: 7ace6161b621d31e7902eb6b5ae148d12cfd23f4a249b9ffb6b9fee12084323d
    suffix: 24/9f/a9ae1e6efa11992dba2c4727d94602bd2f6ee5f0dedc29ee2d5d572c20f7/pathspec-0.10.1.tar.gz
