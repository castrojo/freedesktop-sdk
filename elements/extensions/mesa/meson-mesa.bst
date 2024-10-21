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
  ref: 1.6.0-0-g4c6c89ca7afa6244ba888ce08936acb470e126aa
- kind: patch
  path: patches/meson/meson-no-lib64.patch
  strip-level: 0
