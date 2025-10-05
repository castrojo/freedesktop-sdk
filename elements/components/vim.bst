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
  ref: v9.1.1825-0-gc51d1cc578da32939ee458e98d78b180e1235b4b
- kind: patch
  path: patches/vim/vim-not-show-in-gnome.patch
