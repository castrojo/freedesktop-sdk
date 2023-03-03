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
  ref: v6.2-0-g6439e92cba81c068afca76f8e010fb7175620176
