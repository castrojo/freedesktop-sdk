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
  # we track only major releases because there are several new minor tags every day
  track: v*.0
  ref: v9.1.2146-0-gfb5777fa209785db6aa439b712cab814264e05ca
- kind: patch
  path: patches/vim/vim-not-show-in-gnome.patch
