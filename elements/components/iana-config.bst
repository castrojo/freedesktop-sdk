kind: manual

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
  type: build

public:
  cpe:
    version-match: '(\d+)-(\d+)-(\d+)'

config:
  build-commands:
  - |
    python3 generate.py

  install-commands:
  - |
    install -D -m644 -t "%{install-root}%{sysconfdir}" protocols services

sources:
- kind: git_repo
  url: fdsdk_mirror:iana-config.git
  track: '*-*-*'
  ref: 2019-07-16-0-g64c890c79086d9797c5fb76f9edf5a5bfe906bbb

- kind: local
  path: files/iana-config
