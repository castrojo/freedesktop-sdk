kind: manual

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst

config:
  build-commands:
  - |
    python3 ./configure.py --bootstrap

  install-commands:
  - |
    install -D -m 0755 ninja %{install-root}%{bindir}/ninja

sources:
- kind: git_tag
  url: github:ninja-build/ninja.git
  track: release
  ref: v1.11.1-0-ga524bf3f6bacd1b4ad85d719eed2737d8562f27a
