kind: autotools

depends:
- bootstrap-import.bst

variables:
  builddir: ''

sources:
- kind: git_tag
  url: github:vim/vim.git
  track: master
  ref: v9.0.1683-0-g6efb1980336ff324e9c57a4e282530b952fca816
