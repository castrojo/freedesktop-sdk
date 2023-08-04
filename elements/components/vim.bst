kind: autotools

depends:
- bootstrap-import.bst

variables:
  builddir: ''

sources:
- kind: git_tag
  url: github:vim/vim.git
  track: master
  ref: v9.0.1677-0-g4c0089d696b8d1d5dc40568f25ea5738fa5bbffb
