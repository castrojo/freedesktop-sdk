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
  ref: 1.7.0-0-g897b6fcdf9adfa87fe60f420e1b483f0f49af7a3
- kind: patch
  path: patches/meson/meson-no-lib64.patch
  strip-level: 0
