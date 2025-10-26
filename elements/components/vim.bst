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
  ref: v9.1.1871-0-g826326f13b0af34b5f1c6f15e480dfaece3787c6
- kind: patch
  path: patches/vim/vim-not-show-in-gnome.patch
