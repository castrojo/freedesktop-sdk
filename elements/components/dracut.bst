kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/asciidoc.bst
- components/asciidoctor.bst
- components/libxslt.bst
- components/docbook-xsl.bst
- components/systemd.bst

depends:
- public-stacks/runtime-minimal.bst
- components/kmod.bst
- components/e2fsprogs.bst

runtime-depends:
- components/cpio.bst
- components/gawk.bst


variables:
  # This project documents it doesn't support build-dir
  build-dir: ''
  lib: 'lib'

sources:
- kind: git_repo
  url: github:dracut-ng/dracut-ng.git
  track: '[0-9]*'
  ref: 109-0-g13c5e5feee9ba86b960d351f87aa0eb25f242ff0
