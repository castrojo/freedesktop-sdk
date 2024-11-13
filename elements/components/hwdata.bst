kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

variables:
  build-dir: ''

sources:
- kind: git_repo
  url: github:vcrhonek/hwdata.git
  track: v*
  exclude:
  - 'v*-*'
  ref: v0.389-0-g5313a12eb992a354c17fc895c1d69c8c42b09a06
