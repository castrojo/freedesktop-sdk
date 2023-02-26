kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

sources:
- kind: git_repo
  url: github:akheron/jansson.git
  track: v*
  ref: v2.14-0-g684e18c927e89615c2d501737e90018f4930d6c5
