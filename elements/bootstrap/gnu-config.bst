# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual
description: GNU config scripts

(@):
- elements/bootstrap/include/common.yml

build-depends:
- bootstrap/base-sdk/binary-seed.bst

environment:
  CFLAGS: ""
  CXXFLAGS: ""
  LDFLAGS: ""

variables:
  license-element-name: gnu-config
  lib: lib
  strip-binaries: ''

config:
  install-commands:
  - |
    install -d "%{install-root}%{datadir}/gnu-config"
  - |
    install -m 0644 config.guess config.sub "%{install-root}%{datadir}/gnu-config"
  - |
    install -m 0644 config.sub "%{install-root}%{datadir}/gnu-config"

  - |
    %{install-extra}

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
  ref: 428664896cf9e92d264976a960c76660938dffce
