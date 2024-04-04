kind: manual

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
  type: build

config:
  build-commands:
  - |
    python3 generate.py

  install-commands:
  - |
    install -D -m644 -t "%{install-root}%{sysconfdir}" protocols services

sources:
- kind: git_repo
  url: gitlab:freedesktop-sdk/mirrors/iana-config.git
  track: '*-*-*'
  ref: 2019-07-16-0-g64c890c79086d9797c5fb76f9edf5a5bfe906bbb
- kind: local
  path: files/iana-config
