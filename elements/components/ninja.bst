kind: manual

build-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
- bootstrap/sed.bst
- components/gcc.bst
- components/_private/python3-minimal.bst
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

  - |
    %{install-extra}

public:
  cpe:
    vendor: ninja_build

sources:
- kind: git_repo
  url: github:ninja-build/ninja.git
  track: v*
  ref: v1.13.2-0-g3441b633c2fe2c494e958780ba0f4227b1327634
