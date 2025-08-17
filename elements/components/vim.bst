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
  ref: v9.1.1640-0-gc08b94b072588d69e0fe76bc93dcd1d8c46be469
- kind: patch
  path: patches/vim/vim-not-show-in-gnome.patch
