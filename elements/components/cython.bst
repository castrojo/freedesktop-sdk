kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

runtime-depends:
- components/python3.bst

sources:
- kind: pypi
  name: cython
  ref:
    sha256sum: 6e381fa0bf08b3c26ec2f616b19ae852c06f5750f4290118bf986b6f85c8c527
    suffix: da/a0/298340fb8412574a0b00a0d9856aa27e7038da429b9e31d6825173d1e6bd/Cython-0.29.35.tar.gz
