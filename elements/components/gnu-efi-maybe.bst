kind: stack

(?):
- target_arch in ["x86_64", "i686", "aarch64", "riscv64"]:
    depends:
    - components/_private/gnu-efi.bst
