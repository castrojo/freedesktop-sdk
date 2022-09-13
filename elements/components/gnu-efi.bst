kind: manual

depends:
- filename: bootstrap-import.bst

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
- kind: git_tag
  url: sourceforge_git:gnu-efi/code.git
  track: master
  ref: 3.0.15-0-g8b018e67212957de176292f95718df48f49a418b
