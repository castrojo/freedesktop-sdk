kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/python3-setuptools.bst
- components/python3-sphinx.bst
- components/systemd-libs.bst

depends:
- components/lzo.bst
- components/zstd.bst
- components/e2fsprogs.bst
- bootstrap-import.bst

variables:
  builddir: ''

sources:
- kind: git_tag
  url: kernel:linux/kernel/git/kdave/btrfs-progs.git
  track: master
  ref: v6.2.1-0-g366cd079bc43241b27e0838be0c5369aa00716f8
