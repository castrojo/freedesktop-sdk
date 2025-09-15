kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/itstool.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: gnome:yelp-xsl.git
  track: '*.*'
  exclude:
  - '*rc*'
  - '*beta*'
  - '*alpha*'
  ref: 49.0-0-ge322840d78289fe05c0824670cbcd729816273bd
