kind: autotools

depends:
- bootstrap-import.bst

variables:
  builddir: ''

sources:
- kind: git_tag
  url: github:vim/vim.git
  track: master
  ref: v9.0.1787-0-gd42f95bbfb5abcc78a0cc99f326691f328a2f33e
