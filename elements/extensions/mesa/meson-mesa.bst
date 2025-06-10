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
  ref: 1.8.2-0-g5a82ea0501736a666ca9cc003ea0774f8219fd65
- kind: patch
  path: patches/meson/meson-no-lib64.patch
  strip-level: 0
