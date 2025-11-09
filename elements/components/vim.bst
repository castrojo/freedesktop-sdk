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
  ref: v9.1.1900-0-g47c30bb03a765c9a89c0a9a8eadc414611866df6
- kind: patch
  path: patches/vim/vim-not-show-in-gnome.patch
