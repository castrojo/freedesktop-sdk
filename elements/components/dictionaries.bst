kind: manual

build-depends:
- components/python3.bst
- components/perl.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - |
    DESTDIR="%{install-root}" ./install_dicts.py */dictionaries.xcu

  - |
    ln -s hunspell "%{install-root}%{datadir}/myspell"

sources:
- kind: git_repo
  url: git_https:git.libreoffice.org/dictionaries.git
  track: libreoffice-*
  exclude:
  - '*branch-point*'
  - '*-android'
  - '*alpha*'
  - '*beta*'
  - '*macfix*'
  ref: libreoffice-25.2.3.2-0-g3bba7dc6880336e2a8657f9e52ac08e2aecbe3f9
- kind: local
  path: files/dictionaries/install_dicts.py
- kind: local
  path: files/dictionaries/th_gen_idx.pl
