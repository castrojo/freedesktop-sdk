kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/asciidoc.bst
- components/docbook-xsl.bst
- components/libxslt.bst
- components/python3-setuptools.bst
- components/python3-sphinx.bst
- components/python3-sphinx-rtd-theme.bst
- components/xmlto.bst

depends:
- bootstrap-import.bst
- components/e2fsprogs.bst
- components/lzo.bst
- components/systemd-libs.bst
- components/zstd.bst

variables:
  # Makefile not generated inside build-dir
  build-dir: ''

sources:
- kind: git_repo
  url: kernel:linux/kernel/git/kdave/btrfs-progs.git
  track: v*
  ref: v6.17-0-gc03e29f083678f47a7d7d810db4d21d905979b77
