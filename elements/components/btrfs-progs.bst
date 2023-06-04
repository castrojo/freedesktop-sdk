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
  ref: v6.3.1-0-g9d2c8c364a6b8df4b1a47ad384cd75fd4ba53e12
