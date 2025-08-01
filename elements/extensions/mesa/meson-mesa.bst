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
  ref: 1.8.3-0-g872ae45f7f088524676eccf26959f0fd6dfa1b13
- kind: patch
  path: patches/meson/meson-no-lib64.patch
  strip-level: 0
