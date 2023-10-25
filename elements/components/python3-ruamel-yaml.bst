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
    sha256sum: 9bce33f7a814cea4c29a9c62fe872d2363d6220b767891d956eacea8fa5e6fe8
    suffix: 
      65/40/34c5fe13ef544ed241fb2dd621d0160c065652a0575137b5ad66e5b279c8/ruamel.yaml-0.18.2.tar.gz
