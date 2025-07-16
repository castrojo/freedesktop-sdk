kind: make

build-depends:
- components/git-minimal.bst
- components/go-md2man.bst
- components/go.bst
- public-stacks/buildsystem-make.bst

environment:
  GOPATH: "%{build-root}"

variables:
  ldflags_defaults: ""
  optimize-debug: "false"
  strip-binaries: ''
  command-subdir: src/github.com/containers/common
  make-args: >-
    PREFIX="%{prefix}"
    docs

config:
  install-commands:
    (>):
    - install -Dm644 ../../../../image/default-policy.json 
      "%{install-root}%{sysconfdir}/containers/policy.json"
    - install -Dm644 ../../../../image/default.yaml 
      "%{install-root}%{sysconfdir}/containers/registries.d/default.yaml"
    - install -Dm644 ../../../../image/registries.conf 
      "%{install-root}%{sysconfdir}/containers/registries.conf"
    - install -Dm644 ../../../../shortnames/shortnames.conf 
      "%{install-root}%{sysconfdir}/containers/registries.conf.d/000-shortnames.conf"

    - install -Dm644 ../../../../storage/storage.conf 
      "%{install-root}%{datadir}/containers/storage.conf"
    - install -Dm644 pkg/config/containers.conf 
      "%{install-root}%{datadir}/containers/containers.conf"
    - install -Dm644 pkg/seccomp/seccomp.json 
      "%{install-root}%{datadir}/containers/seccomp.json"
    - install -Dm644 pkg/subscriptions/mounts.conf 
      "%{install-root}%{datadir}/containers/mounts.conf"

sources:
- kind: git_repo
  url: github:containers/common.git
  directory: src/github.com/containers/common
  track: v*
  exclude:
  - "v1.0.1"
  ref: v0.63.1-0-gd6ac18135ce76f94603d9d426653dd37d2ea7ff1
- kind: git_repo
  url: github:containers/image.git
  directory: image
  track: v*
  ref: v5.36.0-0-g08ce6b4207e7b151ea1c2830cdb1d4473cfd12aa
- kind: git_repo
  url: github:containers/storage.git
  directory: storage
  track: v*
  ref: v1.59.0-0-g51223aa059d7dfdff76c2f242b4048c97e2fc972
- kind: git_repo
  url: github:containers/shortnames.git
  directory: shortnames
  track: v*
  ref: v2025.03.19-0-g4b8136e465e6b1e866a3cac8fdc3a7ff91d183d8
