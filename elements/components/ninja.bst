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
  ref: v1.13.0-0-gb4d51f6ed5bed09dd2b70324df0d9cb4ecad2638
