kind: pyproject

build-depends:
- components/_private/python3-build.bst
- components/_private/python3-installer.bst
- components/_private/python3-setuptools.bst
- components/_private/python3-wheel.bst
- components/python3-minimal.bst

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
  ref: 1.10.1-0-g33eb51948be7f15890369f798f150a9f6c21c710

