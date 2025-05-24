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
  ref: 1.8.1-0-gbf17c66f63ed97566516057c2bf35131d1ef240d
- kind: patch
  path: patches/meson/meson-no-lib64.patch
  strip-level: 0
