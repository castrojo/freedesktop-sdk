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
  ref: v9.1.1616-0-geeef7c77436a78cd27047b0f5fa6925d56de3cb0
- kind: patch
  path: patches/vim/vim-not-show-in-gnome.patch
