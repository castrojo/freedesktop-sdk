kind: compose

build-depends:
- cross-compilers/glibc-arm.bst

public:
  bst:
    split-rules:
      arch:
        - "%{includedir}/arm-linux-gnueabihf/**"
        - "%{indep-libdir}/arm-linux-gnueabihf/**"
        - "%{prefix}/lib*/ld-linux*.so.*"
        - "/lib*/ld-linux*.so.*"
