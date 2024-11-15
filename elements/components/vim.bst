kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  command-subdir: src
  # FIXME: vim bundles configure script which is broken with
  # build-dir. We would need to generate our own to fix things.
  build-dir: ''

sources:
- kind: git_repo
  url: github:vim/vim.git
  track: v*
  ref: v9.1.0867-0-g5c66e23c624717216d380d938d0bba5d34a004fe
