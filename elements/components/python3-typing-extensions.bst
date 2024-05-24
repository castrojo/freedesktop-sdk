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
    sha256sum: 8cbcdc8606ebcb0d95453ad7dc5065e6237b6aa230a31e81d0f440c30fed5fd8
    suffix: 
      ce/6a/aa0a40b0889ec2eb81a02ee0daa6a34c6697a605cf62e6e857eead9e4f85/typing_extensions-4.12.0.tar.gz
