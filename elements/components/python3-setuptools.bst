kind: distutils

depends:
- bootstrap-import.bst
- components/python3.bst
- components/util-linux.bst

sources:
- kind: pypi
  name: setuptools
  ref:
    sha256sum: b440ee5f7e607bb8c9de15259dba2583dd41a38879a7abc1d43a71c59524da48
    suffix: 5f/36/7374297692bb9dbd7569a0f84887c7e5e314c41d5d9518cb76fbb130620d/setuptools-67.2.0.tar.gz
