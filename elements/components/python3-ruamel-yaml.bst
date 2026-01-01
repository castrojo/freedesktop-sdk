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
    sha256sum: ff19233e1eb3e9301e7a3d437847713e361a80faace167639327efbe8c0e5f95
    suffix: 0c/5d/8a1de57b5a11245c61c906d422cd1e66b6778e134a1c68823a451be5759c/ruamel_yaml-0.19.0.tar.gz
