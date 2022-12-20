kind: manual

depends:
- bootstrap-import.bst

runtime-depends:
- components/python3.bst
- components/python3-requests.bst
- components/python3-aiohttp.bst
- components/python3-aiosignal.bst
- components/python3-chardet.bst
- components/pygobject.bst
- components/python3-tenacity.bst

config:
  install-commands:
  - |
    install -Dm755 -t "%{install-root}%{bindir}" flat-manager-client

public:
  bst:
    integration-commands:
    - |
      flat-manager-client --help > /dev/null

sources:
- kind: git_repo
  url: github:flatpak/flat-manager.git
  track: '*.*.*'
  ref: 0.3.7-0-g5252cb3f691d82d74b3ef5eb0276e216f215e461
