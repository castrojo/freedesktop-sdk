kind: autotools

depends:
- bootstrap-import.bst

variables:
  builddir: ''

sources:
- kind: git_tag
  url: github:vim/vim.git
  track: master
  ref: v9.0.0813-0-g4bc85f23ed2cf1fab20597ff15cefa675ea5e2c6
