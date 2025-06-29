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
  ref: v9.1.1492-0-gbbeaa94e0e5517063a7a49d6a419ad3d1f5edf38
- kind: patch
  path: patches/vim/vim-not-show-in-gnome.patch
