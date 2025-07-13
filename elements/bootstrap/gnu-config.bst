kind: manual
description: GNU config scripts

(@):
- elements/bootstrap/include/common.yml

build-depends:
- bootstrap/base-sdk/binary-seed.bst

variables:
  lib: lib
  strip-binaries: ''

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
  ref: a2287c3041a3f2a204eb942e09c015eab00dc7dd
