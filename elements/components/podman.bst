kind: make

build-depends:
- components/pkg-config.bst
- components/go.bst
- components/go-md2man.bst
- components/git-minimal.bst
- components/standard-streams.bst

depends:
- components/libseccomp.bst
- components/systemd-libs.bst
- components/gpgme.bst
- bootstrap-import.bst

runtime-depends:
- components/conmon.bst
- components/cni.bst
- components/crun.bst
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
  ref: v3.4.7-0-g74d67f5d43bcd322a4fb11a7b58eced866f9d0b9
