kind: compose

build-depends:
- cross-compilers/glibc-aarch64.bst

public:
  bst:
    split-rules:
      arch:
        - "%{includedir}/aarch64-linux-gnu/**"
        - "%{indep-libdir}/aarch64-linux-gnu/**"
        - "%{prefix}/lib*/ld-linux*.so.*"
        - "/lib*/ld-linux*.so.*"
