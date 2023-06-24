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
- kind: git_tag
  url: savannah:config.git
  track: master
  track-tags: False
  ref: 4ad4bb7c30aca1e705448ba8d51a210bbd47bb52
