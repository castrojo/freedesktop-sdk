# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

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

- components/_private/libsmbios.bst
- components/_private/ovmf.bst
- components/_private/opensbi-u-boot.bst
- components/_private/u-boot-qemu.bst
- components/_private/u-boot-unmatched.bst
- components/_private/bpf.bst
- components/_private/efitools-bin.bst
- components/_private/fwupd-efi.bst
- components/_private/gnu-efi.bst
- components/_private/sbsigntools.bst
- components/_private/valgrind.bst
- components/_private/shim.bst
- components/_private/rr.bst
