kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/util-linux.bst
- bootstrap-import.bst

sources:
- kind: git_tag
  url: kernel:linux/kernel/git/jaegeuk/f2fs-tools.git
  track: master
  ref: v1.16.0-0-g06c027abc6153c4a97cba5317844e8dcaaee3cf7
- kind: patch
  path: patches/f2fs-tools/android-config-filter.patch
