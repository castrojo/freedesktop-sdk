kind: pyproject

build-depends:
- public-stacks/buildsystem-python-hatchling.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: filelock
  ref:
    sha256sum: adbc88eabb99d2fec8c9c1b229b171f18afa655400173ddc653d5d01501fb9f2
    suffix: 
      0a/10/c23352565a6544bdc5353e0b15fc1c563352101f30e24bf500207a54df9a/filelock-3.18.0.tar.gz
