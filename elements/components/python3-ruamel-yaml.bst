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
    sha256sum: a2778930d2573358f7c43f26e4bd5715015dccebf53c9943ed611200c1e2adcd
    suffix: 
      ab/d9/1b808820f6ca6433418f8f9b1ff97ebb7105ca10f09f9debc983c6220adc/ruamel.yaml-0.18.4.tar.gz
