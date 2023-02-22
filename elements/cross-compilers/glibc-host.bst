kind: stack

(?):
- cross_host_arch == "x86_64":
    depends:
    - cross-compilers/glibc-x86_64.bst
- cross_host_arch == "aarch64":
    depends:
    - cross-compilers/glibc-aarch64.bst
- cross_host_arch == "arm":
    depends:
    - cross-compilers/glibc-arm.bst
- cross_host_arch == "i686":
    depends:
    - cross-compilers/glibc-i686.bst
- cross_host_arch == "riscv64":
    depends:
    - cross-compilers/glibc-risc64.bst
