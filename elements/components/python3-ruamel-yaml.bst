kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-ruamel-yaml-clib.bst

sources:
- kind: pypi
  name: ruamel.yaml
  ref:
    sha256sum: 270638acec6659f7bb30f4ea40083c9a0d0d5afdcef5e63d666f11209091531a
    suffix: 
      be/f6/ae958c14677098f4fcc0a6b04b382c02f31ec628d2b03910e24f29d9bc58/ruamel.yaml-0.18.7.tar.gz
