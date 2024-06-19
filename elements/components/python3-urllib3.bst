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
    sha256sum: dd505485549a7a552833da5e6063639d0d177c04f23bc3864e41e5dc5f612168
    suffix: 
      43/6d/fa469ae21497ddc8bc93e5877702dca7cb8f911e337aca7452b5724f1bb6/urllib3-2.2.2.tar.gz
