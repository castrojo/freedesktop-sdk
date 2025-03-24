kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

sources:
- kind: git_repo
  url: github:akheron/jansson.git
  track: v*
  ref: v2.14.1-0-ged5cae4ed0621ef409510f94270c9f8f263736d0
