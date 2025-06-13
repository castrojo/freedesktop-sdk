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
  ref: 42.4-0-gf34ed09b99b8772c5f32b48482dc8f32ceed5e64
