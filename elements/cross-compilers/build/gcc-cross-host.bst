kind: stack

(?):
- cross_host_arch == "x86_64":
    depends:
    - cross-compilers/build/gcc-cross-x86_64.bst
- cross_host_arch == "aarch64":
    depends:
    - cross-compilers/build/gcc-cross-aarch64.bst
- cross_host_arch == "arm":
    depends:
    - cross-compilers/build/gcc-cross-arm.bst
- cross_host_arch == "i686":
    depends:
    - cross-compilers/build/gcc-cross-i686.bst
- cross_host_arch == "riscv64":
    depends:
    - cross-compilers/build/gcc-cross-risc64.bst
