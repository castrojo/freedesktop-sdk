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
    sha256sum: 6ffd0a1906ddeac4a46b7b53d288a5a26bfab8f1986ddab3d8e406beda7e6e72
    suffix: 
      05/52/9bb03af8f9e7c238f563a7f5ad1e84583de6d2c5e1cd8cbbbbf0c81ecd5c/ruamel.yaml-0.17.34.tar.gz
