kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/glib.bst
- components/libslirp.bst
- components/libcap.bst
- components/libseccomp.bst

sources:
- kind: git_tag
  url: github:rootless-containers/slirp4netns.git
  track: master
  exclude:
  - '*beta*'
  ref: v1.2.3-0-gc22fde291bb35b354e6ca44d13be181c76a0a432
