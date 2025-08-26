kind: stack

(?):
- target_arch in ["x86_64", "aarch64"]:
    depends:
    - components/vmlinuxh-pregenerated.bst
- target_arch not in ["x86_64", "aarch64"]:
    depends:
    - components/vmlinuxh-rebuild.bst
