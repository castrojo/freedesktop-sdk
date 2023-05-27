kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-flit-core.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: typing-extensions
  ref:
    sha256sum: 06006244c70ac8ee83fa8282cb188f697b8db25bc8b4df07be1873c43897060c
    suffix: be/fc/3d12393d634fcb31d5f4231c28feaf4ead225124ba08021046317d5f450d/typing_extensions-4.6.2.tar.gz
