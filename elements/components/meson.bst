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
  ref: 1.3.0-0-g7368795d13081d4928a9ba04d48498ca2442624b
- kind: patch
  path: patches/meson/meson-no-lib64.patch
  strip-level: 0
