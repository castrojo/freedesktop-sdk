kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/libmnl.bst

sources:
- kind: git_repo
  url: netfilter:libnftnl
  track: libnftnl-*
  ref: libnftnl-1.2.4-0-g141cc997755dd91e94dd64c5497f2a23bd9a894c
