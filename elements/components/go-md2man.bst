kind: manual

build-depends:
- components/go.bst

depends:
- bootstrap-import.bst

variables:
  optimize-debug: "false"
  compress-debug: "false"

config:
  build-commands:
  - |
    go build -mod=vendor

  install-commands:
  - |
    install -Dm755 go-md2man -t "%{install-root}%{bindir}"

sources:
- kind: git_repo
  url: github:cpuguy83/go-md2man.git
  track: v*
  ref: v2.0.4-0-gd6816bfbea7506064a28119f805fb79f9bc5aeec
- kind: go_module
  url: github:russross/blackfriday.git
  module: github.com/russross/blackfriday/v2
  ref:
    go-version: v2.1.0
    git-ref: v2.1.0-0-g4c9bf9512682b995722660a4196c0013228e2049
    explicit: True
