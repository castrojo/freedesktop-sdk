kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: charset-normalizer
  ref:
    sha256sum: 6fce4b8500244f6fcb71465d4a4930d132ba9ab8e71a7859e6a5d59851068d14
    suffix: 
      83/2d/5fd176ceb9b2fc619e63405525573493ca23441330fcdaee6bef9460e924/charset_normalizer-3.4.3.tar.gz
- kind: patch
  path: patches/python3-charset-normalizer/rm-mypy.patch
