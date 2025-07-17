kind: stack

(?):
- target_arch in ["x86_64", "aarch64"]:
    depends:
    - components/bpf.bst
    - components/vmlinuxh.bst
