kind: compose

build-depends:
- cross-compilers/glibc-i686.bst

public:
  bst:
    split-rules:
      arch:
        - "%{includedir}/i386-linux-gnu/**"
        - "%{indep-libdir}/i386-linux-gnu/**"
        - "%{prefix}/lib*/ld-linux*.so.*"
        - "/lib*/ld-linux*.so.*"
