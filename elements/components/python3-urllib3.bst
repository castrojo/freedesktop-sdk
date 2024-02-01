kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-hatchling.bst

depends:
- components/python3.bst


sources:
- kind: pypi
  name: urllib3
  ref:
    sha256sum: 051d961ad0c62a94e50ecf1af379c3aba230c66c710493493560c0c223c49f20
    suffix: 
      e2/cc/abf6746cc90bc52df4ba730f301b89b3b844d6dc133cb89a01cfe2511eb9/urllib3-2.2.0.tar.gz
