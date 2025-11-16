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
  ref: v9.1.1917-0-ga650485ed53cba4eb4d74e743a708fa51e2dd6db
- kind: patch
  path: patches/vim/vim-not-show-in-gnome.patch
