kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/glib.bst
- components/libslirp.bst
- components/libcap.bst
- components/libseccomp.bst

sources:
- kind: git_repo
  url: github:rootless-containers/slirp4netns.git
  track: v*
  exclude:
  - '*beta*'
  - '*rc*'
  ref: v1.3.2-0-g0f13345bcef588d2bb70d662d41e92ee8a816d85
