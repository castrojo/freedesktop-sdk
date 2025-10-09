kind: manual

depends:
- public-stacks/runtime-minimal.bst

runtime-depends:
- components/python3.bst
- components/python3-requests.bst
- components/python3-aiohttp.bst
- components/python3-aiosignal.bst
- components/python3-chardet.bst
- components/pygobject.bst
- components/python3-tenacity.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - |
    install -Dm755 -t "%{install-root}%{bindir}" flat-manager-client

  - |
    %{install-extra}

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
  ref: 0.4.6-0-gf2c1871ea46a8f047b05713c5f0fcf78ee443128
