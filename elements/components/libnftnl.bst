kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/libmnl.bst

sources:
- kind: git_tag
  url: netfilter:libnftnl
  track: master
  ref: libnftnl-1.2.3-0-g817c8b66f1ea8c223b7513d4cd7bff525d8a0a9f
