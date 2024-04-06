kind: make

build-depends:
- components/pkg-config.bst
- components/git.bst
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
  ref: v2.1.10-0-g2dcd736e46ded79a53339462bc251694b150f870
