kind: filter

build-depends:
- components/gcc-base.bst

runtime-depends:
- bootstrap/glibc.bst
- components/gcc-manifest.bst
- components/libgcc-s.bst

config:
  include:
  - libstdc++

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libstdc++.so'
        - '%{datadir}/gcc-*/python'
        - '%{datadir}/gcc-*/python/**'
        - '%{datadir}/gdb'
        - '%{datadir}/gdb/**'
