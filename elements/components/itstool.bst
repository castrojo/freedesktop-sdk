kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
- filename: components/libxslt.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

variables:
  conf-local: PYTHON="/usr/bin/python3"

sources:
- kind: git_repo
  url: github:itstool/itstool.git
  track: '*.*.*'
  ref: 2.0.7-0-gf1c6544dcd83a73a5ccea9e0c48cf9a47e006190
