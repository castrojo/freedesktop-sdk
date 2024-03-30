kind: manual

depends:
- filename: bootstrap-import.bst

environment:
  # https://sourceforge.net/p/gnu-efi/bugs/33/
  LDFLAGS: "-z relro -z now --as-needed"

variables:
  make-args: |
    INSTALLROOT='%{install-root}' \
    LIBDIR='%{libdir}' \
    PREFIX='%{prefix}'

config:
  build-commands:
  - |
    make %{make-args}

  install-commands:
  - |
    make -j1 %{make-args} install

sources:
- kind: git_repo
  url: sourceforge_git:gnu-efi/code.git
  track: '*.*.*'
  ref: 3.0.18-0-g74bd9b60ba4b59117490ffd54b9fb68bbe91d6b8
