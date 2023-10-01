kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/openssl.bst

sources:
- kind: git_repo
  url: github:libevent/libevent.git
  track: release-*-stable
  ref: release-2.1.12-stable-0-g5df3037d10556bfcb675bc73e516978b75fc7bc7
