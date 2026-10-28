# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

build-depends:
- public-stacks/buildsystem-go.bst
- components/hermes.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  optimize-debug: "false"

config:
  configure-commands:
  - hermes shell
  - hermes serve --daemonize

  build-commands:
  - |
    go build
    ./go-md2man -in=go-md2man.1.md -out=go-md2man.1

  install-commands:
  - |
    install -Dm755 go-md2man -t "%{install-root}%{bindir}"
    install -Dm644 go-md2man.1 "%{install-root}%{mandir}/man1/go-md2man.1"

  - |
    %{install-extra}

sources:
- kind: git_repo
  url: github:cpuguy83/go-md2man.git
  track: v*
  ref: v2.0.7-0-g061b6c7cbecd6752049221aa15b7a05160796698
- kind: hermes
  ref:
  - kind: GoModule
    url: https://proxy.golang.org/github.com/russross/blackfriday/v2/@v/v2.1.0.mod
    digest:
      kind: Sha256Sum
      value: c39547cce6e866e8cfa395d2937bce30801cd07f0b901c2133248f1fba12f58d
  - kind: GoPackage
    url: https://proxy.golang.org/github.com/russross/blackfriday/v2/@v/v2.1.0.zip
    digest:
      kind: Sha256Sum
      value: 7852750d58a053ce38b01f2c203208817564f552ebf371b2b630081d7004c6ae
