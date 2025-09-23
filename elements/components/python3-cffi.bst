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
  include:
  - "1.17.*"
  ref:
    sha256sum: 1c39c6016c32bc48dd54561950ebd6836e1670f2ae46128f67cf49e789c52824
    suffix: 
      fc/97/c783634659c2920c3fc70419e3af40972dbaf758daa229a7d6ea6135c90d/cffi-1.17.1.tar.gz
