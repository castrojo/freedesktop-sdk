kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/util-linux-full.bst
- bootstrap-import.bst

sources:
- kind: git_repo
  url: kernel:linux/kernel/git/jaegeuk/f2fs-tools.git
  track: v*
  ref: v1.15.0-0-g64f2596142800c215cb40a658ebd5793ed37c936
- kind: patch
  path: patches/f2fs-tools/android-config-filter.patch
