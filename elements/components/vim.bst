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
  ref: v9.1.0113-0-g9071ed8107244e0c56a16b77d1c28e975cb21dd2
