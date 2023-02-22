kind: compose

build-depends:
- cross-compilers/glibc-riscv64.bst

public:
  bst:
    split-rules:
      arch:
        - "%{includedir}/riscv64-linux-gnu/**"
        - "%{indep-libdir}/riscv64-linux-gnu/**"
        - "%{prefix}/lib*/ld-linux*.so.*"
        - "/lib*/ld-linux*.so.*"
