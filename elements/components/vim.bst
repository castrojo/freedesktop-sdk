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
  ref: v9.1.2125-0-gb39b065d6fde5f214feebab882b8ebba78945035
- kind: patch
  path: patches/vim/vim-not-show-in-gnome.patch
