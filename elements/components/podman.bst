kind: make

build-depends:
- components/pkg-config.bst
- components/go.bst
- components/go-md2man.bst
- components/git-minimal.bst
- components/python3.bst

depends:
- components/libseccomp.bst
- components/systemd-libs.bst
- components/gpgme.bst
- bootstrap-import.bst

runtime-depends:
- components/catatonit.bst
- components/conmon.bst
- components/cni.bst
- components/crun.bst
- components/netavark.bst
- components/passt.bst
- components/slirp4netns.bst
- components/fuse-overlayfs.bst
- components/iptables.bst
- components/podman-config.bst

environment:
  GOPATH: "%{build-root}"

variables:
  ldflags_defaults: ""
  optimize-debug: "false"
  compress-debug: "false"
  command-subdir: src/github.com/containers/podman

sources:
- kind: git_repo
  url: github:containers/podman.git
  directory: src/github.com/containers/podman
  track: v*
  exclude:
  - "*rc*"
  ref: v4.7.2-0-g750b4c3a7c31f6573350f0b3f1b787f26e0fe1e3
