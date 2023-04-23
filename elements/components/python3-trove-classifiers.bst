kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-calver.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: trove-classifiers
  ref:
    sha256sum: 65e8cb3929e3788141db90a0776b76fcafbeb548a4fbe6aee4bfd9656e899939
    suffix: 94/ab/bc75f31d4ba001eda976a63a2eb1733e4911dc1cac3929b37cd21c88390a/trove-classifiers-2023.4.22.tar.gz
