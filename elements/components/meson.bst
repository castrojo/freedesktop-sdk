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
  ref: 1.2.3-0-g84e437179da05db10aa2457322c54f4ec8be61f1
- kind: patch
  path: patches/meson/meson-no-lib64.patch
  strip-level: 0
