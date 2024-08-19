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
  ref: 1.4.2-0-g8280db82f22fa236c172458ca22771b28f2cbe7c
- kind: patch
  path: patches/meson/meson-no-lib64.patch
  strip-level: 0
