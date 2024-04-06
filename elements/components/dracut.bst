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
  url: kernel:boot/dracut/dracut.git
  track: '[0-9]*'
  ref: 056-0-g631d5f72a223288aa1f48bb8e8d0313e75947400
- kind: patch
  path: patches/dracut/dracut-riscv64-efi.patch
