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
  ref: v9.1.1713-0-g5355e81868ea9e6a14eeba4b9140aa1bf239fb65
- kind: patch
  path: patches/vim/vim-not-show-in-gnome.patch
