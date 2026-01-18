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
  ref: v9.1.2090-0-g6c118afeaae756f3bbb9793e6b248517ad39a3aa
- kind: patch
  path: patches/vim/vim-not-show-in-gnome.patch
