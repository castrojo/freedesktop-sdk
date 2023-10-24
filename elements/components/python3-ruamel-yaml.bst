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
    sha256sum: 8b0fc1c60575b6fc2c1ddff9381e422eb2c2d988fc2e3a138389f68cebe0a6f8
    suffix: 
      02/35/456b8f54f1b33141bd6940ff021c914606e6b5e760e77f59cd19da096067/ruamel.yaml-0.18.0.tar.gz
