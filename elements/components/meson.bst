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
  ref: 1.3.1-0-g110642dd7337347d0278451a1df11efd93d8ed8a
- kind: patch
  path: patches/meson/meson-no-lib64.patch
  strip-level: 0
