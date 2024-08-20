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
  ref: 1.5.1-0-gb6b634ad33e5ca9ad4a9d6139dba4244847cc0e8
- kind: patch
  path: patches/meson/meson-no-lib64.patch
  strip-level: 0
