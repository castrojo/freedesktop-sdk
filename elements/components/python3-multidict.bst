kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: multidict
  ref:
    sha256sum: a835ea8103f4723915d7d621529c80ef48db48ae0c818afcabe0f95aa1febc3a
    suffix: 
      5c/43/2d90c414d9efc4587d6e7cebae9f2c2d8001bcb4f89ed514ae837e9dcbe6/multidict-6.5.1.tar.gz
