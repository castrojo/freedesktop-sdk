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
  ref: v9.1.1798-0-gd9318acc0223bafd3ed5e7f8cdde26328bf200e7
- kind: patch
  path: patches/vim/vim-not-show-in-gnome.patch
