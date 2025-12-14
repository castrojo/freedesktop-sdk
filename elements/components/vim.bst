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
  ref: v9.1.1976-0-g4438b8e071ac4702e6cfd68dcc39149e5e95d298
- kind: patch
  path: patches/vim/vim-not-show-in-gnome.patch
