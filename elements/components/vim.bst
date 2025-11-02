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
  ref: v9.1.1895-0-g8707b7a15b8a22ee4f60e1f9e7d3d417b20e60d2
- kind: patch
  path: patches/vim/vim-not-show-in-gnome.patch
