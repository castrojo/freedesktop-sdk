kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/libmnl.bst

sources:
- kind: git_tag
  url: netfilter:libnftnl
  track: master
  ref: libnftnl-1.2.5-0-gc62bef65fef638452b4ed1893c2451fc253ca7ca
