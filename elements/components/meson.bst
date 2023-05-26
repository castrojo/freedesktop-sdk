kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:mesonbuild/meson.git
  track: '*.*.*'
  exclude:
  - '*rc*'
  ref: 1.1.1-0-g0266440992769d39266e600a310871fbbb276fdd
- kind: patch
  path: patches/meson/meson-no-lib64.patch
  strip-level: 0
