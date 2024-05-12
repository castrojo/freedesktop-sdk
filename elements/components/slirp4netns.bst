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
  ref: v1.3.1-0-ge5e368c4f5db6ae75c2fce786e31eef9da6bf236
