kind: autotools

depends:
- public-stacks/runtime-minimal.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

sources:
- kind: git_repo
  url: github:dosfstools/dosfstools.git
  track: v*
  ref: v4.2-0-g697f7692c951173c1b732901e13f72bd3182d575

variables:
  conf-local: >-
    --enable-compat-symlinks
