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
  ref: 1.2.1-0-gda78b969ee3635bbea81909aa9ebdad3c77257a5
- kind: patch
  path: patches/meson/meson-no-lib64.patch
  strip-level: 0
- kind: patch
  path: patches/meson/fix-crash-when-installing-a-vala-library-and-python-.patch
  strip-level: 1
