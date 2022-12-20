kind: meson

build-depends:
- components/itstool.bst
- components/libxml2.bst
- components/libxslt.bst
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst
- components/python3-lxml.bst
- components/yelp-xsl.bst

sources:
- kind: git_repo
  url: gnome:yelp-tools.git
  track: '*.*'
  exclude:
  - '*rc*'
  - '*beta*'
  - '*alpha'
  ref: 42.1-0-gfe5ff72ca46fba425143e5dc67d660703c86145f
