kind: pyproject

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: ruamel.yaml.clib
  ref:
    sha256sum: beb2e0404003de9a4cab9753a8805a8fe9320ee6673136ed7f04255fe60bb512
    suffix: 46/ab/bab9eb1566cd16f060b54055dd39cf6a34bfa0240c53a7218c43e974295b/ruamel.yaml.clib-0.2.8.tar.gz
