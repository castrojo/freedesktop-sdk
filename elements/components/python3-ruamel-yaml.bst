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
    sha256sum: 1b7e14f28a4b8d09f8cd40dca158852db9b22ac84f22da5bb711def35cb5c548
    suffix: 
      4a/9f/a073b2c0d916045c3decf885b6fea12d2d1b02f235e89a02606140111138/ruamel.yaml-0.18.8.tar.gz
