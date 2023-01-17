kind: manual

build-depends:
- components/pkg-config.bst
- components/git-minimal.bst
- components/go.bst
- components/go-md2man.bst

depends:
- bootstrap-import.bst

environment:
  GOPATH: "%{build-root}"

variables:
  ldflags_defaults: ""
  optimize-debug: "false"
  compress-debug: "false"
  command-subdir: src/github.com/containernetworking/plugins

config:
  build-commands:
  - |
    ./build_linux.sh

  install-commands:
  - |
    install -Dm755 -t "%{install-root}%{libexecdir}/cni" bin/*

sources:
- kind: git_tag
  url: github:containernetworking/plugins.git
  directory: src/github.com/containernetworking/plugins
  track: main
  exclude:
  - "*rc*"
  ref: v1.2.0-0-gc4d24e80d64393d2c632a825a3486d1c2c0248ec
