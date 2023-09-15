kind: autotools

depends:
- bootstrap-import.bst

variables:
  builddir: ''

sources:
- kind: git_tag
  url: github:vim/vim.git
  track: master
  ref: v9.0.1897-0-g504543f98be2ddb6d49ea2f7e996112868fc54ed
