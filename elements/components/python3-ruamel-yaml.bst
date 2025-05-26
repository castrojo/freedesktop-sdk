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
    sha256sum: b586a3416676566ed45bf679a0909719f7ea7b58c03a9b6e03f905a1e2cd5076
    suffix: 
      9d/8f/dfbab2d5ec83da0605ab935fb43ffa8ab5828455e2c910b7314fdd18e0b8/ruamel.yaml-0.18.11.tar.gz
