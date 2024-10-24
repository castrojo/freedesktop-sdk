kind: stack

(?):
- target_arch in ("i686", "x86_64", "aarch64", "riscv64"):
    depends:
    - components/shim.bst
