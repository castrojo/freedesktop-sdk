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
  # Makefile not generated inside buil-dir
  build-dir: ''

sources:
- kind: git_tag
  url: kernel:linux/kernel/git/kdave/btrfs-progs.git
  track: master
  ref: v6.7-0-ga42b07077f3897a8bc4d8b993596e83e930d1d35
