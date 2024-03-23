kind: autotools

depends:
- bootstrap-import.bst

variables:
  command-subdir: src
  # FIXME: vim bundles configure script which is broken with
  # build-dir. We would need to generate our own to fix things.
  build-dir: ''

sources:
- kind: git_tag
  url: github:vim/vim.git
  track: master
  ref: v9.1.0199-0-gad38769030b5fa86aa0e8f1f0b4266690dfad4c9
