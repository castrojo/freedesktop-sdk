# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: make

build-depends:
- public-stacks/buildsystem-make.bst
- components/_private/git-minimal.bst
- components/go-md2man.bst
- components/go.bst

variables:
  optimize-debug: "false"
  strip-binaries: ''
  command-subdir: src/github.com/containers/common
  make-args: >-
    PREFIX="%{prefix}"
    docs

config:
  install-commands:
    (>):
    - install -Dm644 ../../../../image/default-policy.json "%{install-root}%{sysconfdir}/containers/policy.json"
    - install -Dm644 ../../../../image/default.yaml "%{install-root}%{sysconfdir}/containers/registries.d/default.yaml"
    - install -Dm644 ../../../../image/registries.conf "%{install-root}%{sysconfdir}/containers/registries.conf"
    - install -Dm644 ../../../../shortnames/shortnames.conf "%{install-root}%{sysconfdir}/containers/registries.conf.d/000-shortnames.conf"

    - install -Dm644 ../../../../storage/storage.conf "%{install-root}%{datadir}/containers/storage.conf"
    - install -Dm644 pkg/config/containers.conf "%{install-root}%{datadir}/containers/containers.conf"
    - install -Dm644 pkg/seccomp/seccomp.json "%{install-root}%{datadir}/containers/seccomp.json"
    - install -Dm644 pkg/subscriptions/mounts.conf "%{install-root}%{datadir}/containers/mounts.conf"

sources:
- kind: git_repo
  url: github:containers/common.git
  directory: src/github.com/containers/common
  track: v*
  exclude:
  - "v1.0.1"
  ref: v0.64.2-0-g82146f3af4750038f936ec9cd804d12a837e5cde
- kind: git_repo
  url: github:containers/image.git
  directory: image
  track: v*
  ref: v5.36.2-0-gd464a2540c2f0554dc27c268bfcfa181b2061ab3
- kind: git_repo
  url: github:containers/storage.git
  directory: storage
  track: v*
  ref: v1.59.1-0-g41839ee723fe3e35ff5a6fd2e19340e041b261f3
- kind: git_repo
  url: github:containers/shortnames.git
  directory: shortnames
  track: v*
  ref: v2025.03.19-0-g4b8136e465e6b1e866a3cac8fdc3a7ff91d183d8
