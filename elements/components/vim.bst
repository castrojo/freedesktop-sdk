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
  ref: v9.1.1779-0-g0208b3e80a080740ff77a5661d0f65090e317d90
- kind: patch
  path: patches/vim/vim-not-show-in-gnome.patch
