kind: autotools

build-depends:
- components/pkg-config.bst
- components/asciidoc.bst
- components/asciidoctor.bst
- components/libxslt.bst
- components/docbook-xsl.bst
- components/systemd.bst

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
  ref: 108-0-g97c5568ec42abd5e6035f0cfa9d319ae6ae4e50a
