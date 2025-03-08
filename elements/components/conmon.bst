kind: make

build-depends:
- public-stacks/buildsystem-make.bst
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
  command-subdir: src/github.com/containers/conmon

sources:
- kind: git_repo
  url: github:containers/conmon.git
  directory: src/github.com/containers/conmon
  track: v*
  ref: v2.1.13-0-g82de887596ed8ee6d9b2ee85e4f167f307bb569b
