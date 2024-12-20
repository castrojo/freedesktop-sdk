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
  ref: 1.6.1-0-g98a2951c9bea3094a1b541530b68286fc0119173
- kind: patch
  path: patches/meson/meson-no-lib64.patch
  strip-level: 0
