kind: manual

build-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
- components/python3.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

config:
  build-commands:
  - |
    python3 generate.py

  install-commands:
  - |
    install -D -m644 -t "%{install-root}%{sysconfdir}" protocols services

  - |
    %{install-extra}

sources:
- kind: git_repo
  url: fdsdk_mirror:iana-config.git
  track: '*-*-*'
  ref: 2019-07-16-0-g64c890c79086d9797c5fb76f9edf5a5bfe906bbb
  version-guess-pattern: '(\d+)-(\d+)-(\d+)'
- kind: local
  path: files/iana-config
