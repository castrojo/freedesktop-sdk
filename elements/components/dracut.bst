kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/asciidoc.bst
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
  ref: 106-0-g956c08774074ddc45b2f975e13d5c13d1fc36eff
- kind: patch
  path: patches/dracut/shadow-perm.patch
