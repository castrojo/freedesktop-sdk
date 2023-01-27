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
  ref: v1.8.9-0-g11407d91a1bece630e0e1f2063ce726e4045827d
