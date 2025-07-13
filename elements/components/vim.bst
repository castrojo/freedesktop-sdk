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
  ref: v9.1.1538-0-g7306e8fcdb6fd17276b6aafb23a522cefecb5857
- kind: patch
  path: patches/vim/vim-not-show-in-gnome.patch
