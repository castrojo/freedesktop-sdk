kind: autotools
depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

sources:
- kind: git_repo
  url: github:jpirko/libndp.git
  track: v*
  ref: v1.8-0-g009ce9cd9b950ffa1f4f94c9436027b936850d0c
