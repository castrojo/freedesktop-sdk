kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst

sources:
- kind: pypi
  name: urllib3
  ref:
    sha256sum: 3fa96cf423e6987997fc326ae8df396db2a8b7c667747d47ddd8ecba91f4a74e
    suffix: b2/56/d87d6d3c4121c0bcec116919350ca05dc3afd2eeb7dc88d07e8083f8ea94/urllib3-1.26.12.tar.gz
