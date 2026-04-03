kind: pyproject

build-depends:
- components/python3-build.bst
- components/python3-installer.bst

depends:
- public-stacks/runtime-minimal.bst
- components/meson.bst
- components/patchelf.bst
- components/python3-packaging.bst
- components/python3-pyproject-metadata.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:mesonbuild/meson-python.git
  track: "*.*.*"
  ref: 0.19.0-0-gd7578513e2a73c6a0ab4ea861b16af06115b2e3e
