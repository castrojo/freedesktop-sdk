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
- kind: git_repo
  url: kernel:linux/kernel/git/kdave/btrfs-progs.git
  track: v*
  ref: v6.10.1-0-ga00c2b25474b5306ef29a790adb5fd5afbaba9a2
