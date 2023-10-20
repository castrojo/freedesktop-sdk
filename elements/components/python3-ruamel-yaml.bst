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
    sha256sum: ee9a9178a231306d2b260e67ba497c136d4639d58b08775ab67f5fb0f21e73f0
    suffix: 
      d3/dd/d6f2302a405cf7a5cd71f95ba9c39b1c3c901432aab1e0217cf25679c226/ruamel.yaml-0.17.39.tar.gz
