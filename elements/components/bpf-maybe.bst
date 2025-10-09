kind: stack

(?):
- target_arch in ["x86_64", "aarch64"]:
    depends:
    - components/_private/bpf.bst
    - components/vmlinuxh.bst
