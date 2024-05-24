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
  cpe:
    product: flat-manager

sources:
- kind: git_repo
  url: github:flatpak/flat-manager.git
  track: '*.*.*'
  ref: 0.4.3-0-g13841c5a6667d6ab9d0849523c9e49ad5f34dda8
