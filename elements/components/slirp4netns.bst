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
  ref: v1.2.1-0-g09e31e92fa3d2a1d3ca261adaeb012c8d75a8194
