kind: autotools

depends:
- bootstrap-import.bst

variables:
  builddir: ''

sources:
- kind: git_tag
  url: github:vim/vim.git
  track: master
  ref: v9.0.1833-0-g816fbcc262687b81fc46f82f7bbeb1453addfe0c
