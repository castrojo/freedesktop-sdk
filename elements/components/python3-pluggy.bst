kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: pluggy
  ref:
    sha256sum: cf61ae8f126ac6f7c451172cf30e3e43d3ca77615509771b3a984a0730651e12
    suffix: 36/51/04defc761583568cae5fd533abda3d40164cbdcf22dee5b7126ffef68a40/pluggy-1.3.0.tar.gz
