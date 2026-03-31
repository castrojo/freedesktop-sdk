kind: pyproject

build-depends:
- components/_private/python3-build-bootstrap.bst
- components/_private/python3-flit-core.bst
- components/_private/python3-installer-bootstrap.bst
- components/_private/python3-minimal.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:pypa/installer.git
  track: '*.*.*'
  ref: 1.0.0-0-g506a0158a9516009dbc838dd3f6d024c500eec13
- kind: patch
  path: patches/python3-installer/reproducible_record.patch
