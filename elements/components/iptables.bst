kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/libmnl.bst
- components/libnftnl.bst

sources:
- kind: git_tag
  url: netfilter:iptables
  track: master
  ref: v1.8.10-0-g8ae55c2a331e932c0aeef8c6c138bf60deb9fd42
