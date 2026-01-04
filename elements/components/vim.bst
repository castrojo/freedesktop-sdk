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
  ref: v9.1.2049-0-g4a9967bddfc55499653d5b2e467f488eccb7a2fb
- kind: patch
  path: patches/vim/vim-not-show-in-gnome.patch
