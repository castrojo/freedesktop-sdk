kind: pyproject

build-depends:
- components/_private/python3-build.bst
- components/_private/python3-installer.bst
- components/_private/python3-setuptools.bst
- components/_private/python3-wheel.bst
- components/_private/python3-minimal.bst

depends:
- components/ninja.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:mesonbuild/meson.git
  track: '*.*.*'
  exclude:
  - '*rc*'
  ref: 1.11.0-0-g6ac66b9cbe36e861a4b10cf62d75ec181dfb291a

