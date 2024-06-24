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
- kind: git_repo
  url: github:containernetworking/plugins.git
  directory: src/github.com/containernetworking/plugins
  track: v*
  exclude:
  - "*rc*"
  ref: v1.5.1-0-gc29dc79f96cd50452a247a4591443d2aac033429
