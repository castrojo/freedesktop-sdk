kind: manual

build-depends:
- components/go.bst

depends:
- bootstrap-import.bst

environment:
  GOPATH: "%{build-root}/go"
  GO111MODULE: auto

variables:
  optimize-debug: "false"
  compress-debug: "false"

config:
  build-commands:
  - |
    go build github.com/cpuguy83/go-md2man

  install-commands:
  - |
    go install github.com/cpuguy83/go-md2man

  - |
    install -Dm755 -t "%{install-root}%{bindir}" "${GOPATH}/bin"/*

sources:
- kind: git_repo
  url: github:cpuguy83/go-md2man.git
  directory: go/src/github.com/cpuguy83/go-md2man
  track: v*
  ref: v2.0.2-0-gd97078115282836e16d0dca10b4b42ce60fc70e6
