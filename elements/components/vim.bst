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
  ref: v9.1.1754-0-g6f020cde569073622cc085251e47d82323d5c4bd
- kind: patch
  path: patches/vim/vim-not-show-in-gnome.patch
