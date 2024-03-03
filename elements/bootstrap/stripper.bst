kind: make

build-depends:
- bootstrap/gnu-config.bst
- bootstrap/build/gcc-stage2.bst
- bootstrap/build/debug-utils.bst
- filename: bootstrap/glibc.bst
  config:
    location: "%{sysroot}"

runtime-depends:
- bootstrap/glibc.bst
- bootstrap/debugedit.bst
- bootstrap/dwz.bst
- bootstrap/xz.bst

(@): elements/bootstrap/include/target.yml

environment:
  CXX: "%{triplet}-g++"

public:
  bst:
    split-rules:
      devel:
        (>):
        - "/**"

sources:
- kind: local
  path: files/stripper
