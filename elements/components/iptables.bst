kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/libmnl.bst
- components/libnftnl.bst

sources:
- kind: git_repo
  url: netfilter:iptables
  track: v*
  ref: v1.8.10-0-g8ae55c2a331e932c0aeef8c6c138bf60deb9fd42
