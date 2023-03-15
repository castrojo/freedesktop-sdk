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
  - '*rc'
  ref: 1.0.1-0-gf341097c7e7914c250133bd58feb4985d1fbdcd6
- kind: patch
  path: patches/meson/meson-no-lib64.patch
  strip-level: 0
