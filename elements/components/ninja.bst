kind: manual

build-depends:
- bootstrap/sed.bst
- components/gcc.bst
- components/python3-minimal.bst
- components/stripper.bst

depends:
- public-stacks/runtime-minimal.bst

config:
  build-commands:
  - |
    python3 ./configure.py --bootstrap

  install-commands:
  - |
    install -D -m 0755 ninja %{install-root}%{bindir}/ninja

public:
  cpe:
    vendor: ninja_build

sources:
- kind: git_repo
  url: github:ninja-build/ninja.git
  track: v*
  ref: v1.12.1-0-g2daa09ba270b0a43e1929d29b073348aa985dfaa
