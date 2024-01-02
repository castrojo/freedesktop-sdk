kind: autotools

build-depends:
- components/pkg-config.bst
- components/asciidoc.bst
- components/libxslt.bst
- components/docbook-xsl.bst

depends:
- bootstrap-import.bst
- components/kmod.bst
- components/e2fsprogs.bst

runtime-depends:
- components/cpio.bst


variables:
  # This project documents it doesn't support build-dir
  build-dir: ''
  lib: 'lib'

sources:
- kind: git_repo
  url: github:dracutdevs/dracut.git
  track: '[0-9]*'
  ref: 059-0-g0aa08f0ebff09b4501aad6e0fb7fc0dda04370e6
- kind: patch
  path: patches/dracut/dracut-use-dynamic-uefi-sections.patch
- kind: patch
  path: patches/dracut/dracut-riscv64-efi.patch
- kind: patch
  path: patches/dracut/install-systemd-executor.patch
