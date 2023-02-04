kind: manual
description: GNU config scripts

variables:
  tools: /cross
  toolchain-prefixes: >-
    %{tools}
    /usr
    %{prefix}
  lib: lib

build-depends:
- bootstrap/build/base-sdk.bst

environment:
  CFLAGS: ""
  CXXFLAGS: ""
  LDFLAGS: ""

config:
  install-commands:
  - |
    install -d "%{install-root}%{datadir}/gnu-config"
  - |
    install -m 0644 config.guess config.sub "%{install-root}%{datadir}/gnu-config"
  - |
    install -m 0644 config.sub "%{install-root}%{datadir}/gnu-config"

public:
  bst:
    split-rules:
      runtime: []
      devel:
        (>):
        - '**'

sources:
- kind: git_tag
  url: savannah:config.git
  track: master
  ref: 191bcb948f7191c36eefe634336f5fc5c0c4c2be
  # No tags exist, track HEAD of the branch
