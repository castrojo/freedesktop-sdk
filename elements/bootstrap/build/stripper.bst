kind: make

build-depends:
- bootstrap/base-sdk/binary-seed.bst
- bootstrap/gnu-config.bst

runtime-depends:
- bootstrap/build/debugedit-build.bst
- bootstrap/build/dwz-build.bst

(@):
- elements/bootstrap/include/build.yml

sources:
- kind: local
  path: files/stripper
