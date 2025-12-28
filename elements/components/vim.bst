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
  ref: v9.1.2028-0-gf99de42a9fbc2caaac2741a275b6c25421582cf4
- kind: patch
  path: patches/vim/vim-not-show-in-gnome.patch
