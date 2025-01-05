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
    sha256sum: 59d0f8b10c658bd55ecd107e334d4117d766a2b9cc8f5176afcdadcff6f84a5e
    suffix: 
      37/8f/135c0b5292c36adf8b6ebd1f4747be709b67cfce23f6f16a4776131111a6/ruamel.yaml-0.18.9.tar.gz
