kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/libmnl.bst

sources:
- kind: git_repo
  url: netfilter:libnftnl
  track: libnftnl-*
  ref: libnftnl-1.2.8-0-g06e2cbec41c7cd7f2b1e660ce5e5f949912e32eb
