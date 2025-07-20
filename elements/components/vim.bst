kind: autotools

depends:
- bootstrap-import.bst

variables:
  command-subdir: src
  # FIXME: vim bundles configure script which is broken with
  # build-dir. We would need to generate our own to fix things.
  build-dir: ''

sources:
- kind: git_repo
  url: github:vim/vim.git
  track: v*
  ref: v9.1.1566-0-g0e40501a9d1ff9bd06f8a829a8a255a0964edb3c
- kind: patch
  path: patches/vim/vim-not-show-in-gnome.patch
