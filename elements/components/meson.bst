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
  ref: 1.1.0-0-gae163a3f3e0ccdcbea97c8ad0e78f087925646b9
- kind: patch
  path: patches/meson/meson-no-lib64.patch
  strip-level: 0
