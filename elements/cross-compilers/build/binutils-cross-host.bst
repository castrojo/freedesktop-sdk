kind: stack

(?):
- host_arch == "x86_64":
    depends:
    - cross-compilers/build/binutils-cross-x86_64.bst
- host_arch == "aarch64":
    depends:
    - cross-compilers/build/binutils-cross-aarch64.bst
- host_arch == "arm":
    depends:
    - cross-compilers/build/binutils-cross-arm.bst
- host_arch == "i686":
    depends:
    - cross-compilers/build/binutils-cross-i686.bst
- host_arch == "riscv64":
    depends:
    - cross-compilers/build/binutils-cross-risc64.bst
