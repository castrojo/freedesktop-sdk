kind: stack

(?):
- target_arch in ["x86_64", "i686", "aarch64"]:
    depends:
    - components/fwupd-efi.bst
