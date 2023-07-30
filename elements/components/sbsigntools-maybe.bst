kind: stack

(?):
- target_arch in ["x86_64", "i686", "arm", "aarch64", "riscv64"]:
    depends:
    - components/sbsigntools.bst
