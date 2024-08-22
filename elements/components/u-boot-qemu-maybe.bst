kind: stack

(?):
- target_arch in ["x86_64", "aarch64", "riscv64"]:
    depends:
    - components/u-boot-qemu.bst
