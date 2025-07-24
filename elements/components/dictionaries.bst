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
  - "*android*"
  ref: libreoffice-25.8.0.2-0-ge07fd4bf3f9179404ce5b71099f19e144ec605e0
- kind: local
  path: files/dictionaries/install_dicts.py
- kind: local
  path: files/dictionaries/th_gen_idx.pl
