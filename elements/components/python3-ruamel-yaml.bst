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
    sha256sum: 5c56aa0bff2afceaa93bffbfc78b450b7dc1e01d5edb80b3a570695286ae62b1
    suffix: 
      27/fc/73edf1269fab4ae08ada602f4bf17b0a0428b3bf10574c2ea7331d73f87d/ruamel.yaml-0.17.33.tar.gz
