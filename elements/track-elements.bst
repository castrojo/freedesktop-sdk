kind: stack

depends:
- flatpak-release-repo.bst
- bootstrap/base-sdk/binary-seed-aarch64.bst
- bootstrap/base-sdk/binary-seed-x86_64.bst
- oci/layers/toolbox-stack.bst
- oci/layers/flatpak-stack.bst
- vm/desktop/deps.bst
- components.bst

# Parents of maybe elements from components.bst

- components/bpf.bst
- components/libsmbios.bst
- components/ovmf.bst
- components/u-boot-qemu.bst
- components/u-boot-unmatched.bst
- components/efitools-bin.bst
- components/fwupd-efi.bst
- components/gnu-efi.bst
- components/sbsigntools.bst
- components/valgrind.bst
- components/shim.bst
- components/rr.bst
