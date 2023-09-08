kind: autotools

depends:
- bootstrap-import.bst

variables:
  builddir: ''

sources:
- kind: git_tag
  url: github:vim/vim.git
  track: master
  ref: v9.0.1882-0-gda200c2f78ef3c91557a2b484d284eb0c1c62776
