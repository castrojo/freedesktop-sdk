kind: stack

(?):
- cross_host_arch == "x86_64":
    depends:
    - cross-compilers/freedesktop-sdk-x86_64.bst:bootstrap/zlib.bst
- cross_host_arch == "aarch64":
    depends:
    - cross-compilers/freedesktop-sdk-aarch64.bst:bootstrap/zlib.bst
- cross_host_arch == "arm":
    depends:
    - cross-compilers/freedesktop-sdk-arm.bst:bootstrap/zlib.bst
- cross_host_arch == "i686":
    depends:
    - cross-compilers/freedesktop-sdk-i686.bst:bootstrap/zlib.bst
- cross_host_arch == "riscv64":
    depends:
    - cross-compilers/freedesktop-sdk-riscv64.bst:bootstrap/zlib.bst
