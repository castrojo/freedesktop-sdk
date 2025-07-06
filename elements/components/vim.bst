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
  ref: v9.1.1512-0-gba11e78f1d5342786faed0ebd5b09ffee7f7ff86
- kind: patch
  path: patches/vim/vim-not-show-in-gnome.patch
