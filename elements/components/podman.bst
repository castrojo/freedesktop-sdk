kind: make

build-depends:
- components/pkg-config.bst
- components/go.bst
- components/go-md2man.bst
- components/git-minimal.bst
- components/python3.bst
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
- kind: git_tag
  url: github:containers/podman.git
  directory: src/github.com/containers/podman
  track: main
  track-extra:
  - v4.3
  # Attempt to predict the next branchpoint.
  - v4.4
  exclude:
  - "*rc*"
  ref: v4.4.1-0-g34e8f3933242f2e566bbbbf343cf69b7d506c1cf
