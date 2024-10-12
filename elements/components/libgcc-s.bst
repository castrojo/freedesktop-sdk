kind: filter

build-depends:
- components/gcc-base.bst

runtime-depends:
- components/gcc-manifest.bst
- bootstrap/glibc.bst

config:
  include:
  - libgcc-s

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgcc_s.so'
