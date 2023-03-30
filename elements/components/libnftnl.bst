kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/libmnl.bst

sources:
- kind: git_tag
  url: netfilter:libnftnl
  track: master
  ref: libnftnl-1.2.1-0-g09456c720e9c00eecc08e41ac6b7c291b3821ee5
