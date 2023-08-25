kind: make

build-depends:
- components/pkg-config.bst
- components/git.bst
- components/go.bst
- components/go-md2man.bst

depends:
- components/glib.bst
- components/libseccomp.bst

environment:
  GOPATH: "%{build-root}"

variables:
  ldflags_defaults: ""
  optimize-debug: "false"
  compress-debug: "false"
  command-subdir: src/github.com/containers/conmon

sources:
- kind: git_tag
  url: github:containers/conmon.git
  directory: src/github.com/containers/conmon
  track: main
  ref: v2.1.8-0-g00e08f4a9ca5420de733bf542b930ad58e1a7e7d
