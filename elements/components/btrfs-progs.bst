kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/asciidoc.bst
- components/docbook-xsl.bst
- components/libxslt.bst
- components/python3-setuptools.bst
- components/python3-sphinx.bst
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
  ref: v6.6.2-0-gafa23d4e279ad24027269d6ca5309f894e6daa87
