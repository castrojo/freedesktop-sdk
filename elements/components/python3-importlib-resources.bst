kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: importlib-resources
  ref:
    sha256sum: 32bb095bda29741f6ef0e5278c42df98d135391bee5f932841efc0041f748dc3
    suffix: 1c/c8/cfc6ae38e378be60925f121cce01e7f4996dc3aca424799a693e48c9ce4d/importlib_resources-5.10.1.tar.gz
