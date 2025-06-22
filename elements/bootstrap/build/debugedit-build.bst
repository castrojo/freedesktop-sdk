kind: autotools

(@):
- elements/bootstrap/include/build.yml
- elements/bootstrap/include/debugedit-source.yml

build-depends:
- bootstrap/base-sdk/pkg-config.bst
- bootstrap/base-sdk/xxhash.bst
- bootstrap/gnu-config.bst

depends:
- bootstrap/build/file-stage1.bst
- bootstrap/build/elfutils-build.bst

variables:
  local_ldflags: "-Wl,-rpath,%{tools}/lib"
