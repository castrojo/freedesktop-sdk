kind: pyproject

build-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
- components/python3-build.bst
- components/python3-installer.bst
- components/python3-setuptools.bst

depends:
- components/python3-pyyaml.bst
- components/fakecap.bst

variables:
  strip-binaries: ''

sources:
- kind: local
  path: files/oci
