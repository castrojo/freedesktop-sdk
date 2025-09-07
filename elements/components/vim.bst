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
  ref: v9.1.1738-0-g708ab7f5fbef95c43a3eb6c0a2ad4e02ad4c2f98
- kind: patch
  path: patches/vim/vim-not-show-in-gnome.patch
