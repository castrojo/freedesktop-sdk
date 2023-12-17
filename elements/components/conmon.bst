kind: make

build-depends:
- components/pkg-config.bst
- components/git-minimal.bst
- components/go.bst
- components/go-md2man.bst
- components/systemd.bst

depends:
- components/glib.bst
- components/libseccomp.bst
- components/systemd-libs.bst

environment:
  GOPATH: "%{build-root}"

variables:
  ldflags_defaults: ""
  optimize-debug: "false"
  compress-debug: "false"
  command-subdir: src/github.com/containers/conmon

sources:
- kind: git_repo
  url: github:containers/conmon.git
  directory: src/github.com/containers/conmon
  track: v*
  ref: v2.1.9-0-g3a9715d28cb4cf0e671dfbc4211d4458534db189
