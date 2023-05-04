kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/pkg-config.bst

depends:
- components/libffi.bst
- components/python3.bst
- components/python3-pycparser.bst

sources:
- kind: pypi
  name: cffi
  exclude:
  # cffi-1.0.2-2.tar.gz gets parsed as version 2 by packaging as non-canonical format
  - '2'
  ref:
    sha256sum: d400bfb9a37b1351253cb402671cea7e89bdecc294e8016a707f6d1d8ac934f9
    suffix: 2b/a8/050ab4f0c3d4c1b8aaa805f70e26e84d0e27004907c5b8ecc1d31815f92a/cffi-1.15.1.tar.gz
