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
    sha256sum: 7227b76aaec364df15936730efbf7d72b30c0b79b1d578bbb8e3dcb2d81f52b7
    suffix: 
      39/87/6da0df742a4684263261c253f00edd5829e6aca970fff69e75028cccc547/ruamel.yaml-0.18.14.tar.gz
