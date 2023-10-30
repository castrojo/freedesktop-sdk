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
    sha256sum: 36dbbe90390d977f957436570d2bd540bfd600e6ec5a1ea42bcdb9fc7963d802
    suffix: 
      de/7c/3beeecf83034da740624831b35feb7d540bf939582fea5cfc8b656909a7a/ruamel.yaml-0.18.3.tar.gz
