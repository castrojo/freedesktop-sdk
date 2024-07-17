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
  url: github:dracut-ng/dracut-ng.git
  track: '[0-9]*'
  ref: 103-0-g3fce598fb45aa5618cdf885eb48cf327104ffcb8
- kind: patch
  path: patches/dracut/dracut-riscv64-efi.patch
