kind: manual
description: GNU config scripts

(@):
- elements/bootstrap/include/common.yml

build-depends:
- bootstrap/base-sdk/binary-seed.bst

variables:
  lib: lib

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
- kind: git_repo
  url: savannah:config.git
  track: master
  ref: 948ae97ca5703224bd3eada06b7a69f40dd15a02
