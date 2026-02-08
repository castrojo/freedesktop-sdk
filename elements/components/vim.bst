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
  ref: v9.1.2140-0-g35c428b02c0b8cee77e65d2a560e3c0b4c526395
- kind: patch
  path: patches/vim/vim-not-show-in-gnome.patch
