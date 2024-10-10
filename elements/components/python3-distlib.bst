kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: distlib
  ref:
    sha256sum: a60f20dea646b8a33f3e7772f74dc0b2d0772d2837ee1342a00645c81edf9403
    suffix: 
      0d/dd/1bec4c5ddb504ca60fc29472f3d27e8d4da1257a854e1d96742f15c1d02d/distlib-0.3.9.tar.gz
