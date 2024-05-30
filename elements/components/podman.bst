kind: make

build-depends:
- components/pkg-config.bst
- components/go.bst
- components/go-md2man.bst
- components/git-minimal.bst
- components/standard-streams.bst
- components/python3.bst


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
  ref: v5.1.0-0-g4e9486dbc63c24bfe109066abbb54d5d8dc2489e
