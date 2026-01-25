kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

sources:
- kind: git_repo
  url: github:akheron/jansson.git
  track: v*
  ref: v2.15.0-0-g4a9a6db73d5dc553164992e87426502ab2d54512
