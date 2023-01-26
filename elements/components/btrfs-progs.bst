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
  ref: v6.1.3-0-g908b4b4450320e30fdef693f09b42f4eb93702c3
