kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/itstool.bst
  type: build

sources:
- kind: git_tag
  url: gnome:yelp-xsl.git
  track: master
  exclude:
  - '*rc*'
  - '*beta*'
  - '*alpha*'
  ref: 42.1-0-g1658a8eb59a296d9e7b7116fbc79ca778b702e14
