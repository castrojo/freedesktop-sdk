kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: distlib
  ref:
    sha256sum: feec40075be03a04501a973d81f633735b4b69f98b05450592310c0f401a4e0d
    suffix: 
      96/8e/709914eb2b5749865801041647dc7f4e6d00b549cfe88b65ca192995f07c/distlib-0.4.0.tar.gz
