kind: make

build-depends:
- components/pkg-config.bst
- components/go.bst
- components/go-md2man.bst
- components/git-minimal.bst
- components/python3.bst
- public-stacks/buildsystem-make.bst

depends:
- components/containers-common.bst
- components/gpgme.bst
- components/libseccomp.bst
- components/systemd-libs.bst
- public-stacks/runtime-minimal.bst

runtime-depends:
- components/catatonit.bst
- components/conmon.bst
- components/crun.bst
- components/netavark.bst
- components/passt.bst
- components/slirp4netns.bst
- components/fuse-overlayfs.bst
- components/iptables.bst

environment:
  GOPATH: "%{build-root}"
  MAKEFLAGS: -j1

variables:
  ldflags_defaults: ""
  optimize-debug: "false"
  command-subdir: src/github.com/containers/podman

sources:
- kind: git_repo
  url: github:containers/podman.git
  directory: src/github.com/containers/podman
  track: v*
  exclude:
  - "*rc*"
  ref: v5.6.2-0-g9dd5e1ed33830612bc200d7a13db00af6ab865a4
