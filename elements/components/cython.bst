kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

runtime-depends:
- components/python3.bst

sources:
- kind: pypi
  name: cython
  ref:
    sha256sum: 2235b62da8fe6fa8b99422c8e583f2fb95e143867d337b5c75e4b9a1a865f9e3
    suffix: d4/ad/7ce0cccd68824ac9623daf4e973c587aa7e2d23418cd028f8860c80651f5/Cython-0.29.30.tar.gz
