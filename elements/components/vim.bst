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
  ref: v9.1.1924-0-ga08030c9f729a133da552b5658e5b59c54581c79
- kind: patch
  path: patches/vim/vim-not-show-in-gnome.patch
