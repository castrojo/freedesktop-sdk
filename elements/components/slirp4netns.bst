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
  ref: v1.3.6-0-gdc65f4cc4e086c991d5fc21ca6ac06379eac27ae
