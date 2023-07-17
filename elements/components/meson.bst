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
  ref: 1.2.0-0-gabe01ae3d61f12852184746491814644a7cd9cf0
- kind: patch
  path: patches/meson/meson-no-lib64.patch
  strip-level: 0
