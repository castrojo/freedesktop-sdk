kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/libmnl.bst

sources:
- kind: git_repo
  url: netfilter:libnftnl
  track: libnftnl-*
  ref: libnftnl-1.2.6-0-g83dd4dc316b4189d16ead54cd30bfc89e5160cfd
