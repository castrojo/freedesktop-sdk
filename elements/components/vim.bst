kind: autotools

depends:
- bootstrap-import.bst

variables:
  builddir: ''

sources:
- kind: git_tag
  url: github:vim/vim.git
  track: master
  ref: v9.0.1927-0-gceee7a808ce82b0c6bd84e0b6fc1dfb0475c99aa
