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
- kind: git_tag
  url: github:flatpak/flat-manager.git
  track: 'master'
  track-extra:
  - '0.4.1'
  track-tags: true
  ref: 0.4.1-0-g2b81b6d46586118029b8a5e4b54f5d15b646ff03
- kind: patch
  path: patches/flat-manager-client/Use-TENACITY_RETRY_EXCEPTIONS-for-upload_files-too.patch
- kind: patch
  path: patches/flat-manager-client/Connection-reset-by-peer-results-in-ClientOSError.patch
