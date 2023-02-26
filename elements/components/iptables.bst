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
  ref: v1.8.8-0-gfa0ccdbdbec467ee6a562d5de38eaaefa1016ad7
- kind: patch
  path: patches/iptables/build-Fix-error-during-out-of-tree-build.patch
