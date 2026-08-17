kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/flex.bst

depends:
- public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:martinh/libconfuse.git
  track: v*.*
  ref: v3.4-0-g45b0d08f83190ed20511cfd612e195e6e2d17377
