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
- public-stacks/runtime-minimal.bst
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
  ref: v6.15-0-g3da67f1c78bcbd7556f04d89e31aa4621face50b
