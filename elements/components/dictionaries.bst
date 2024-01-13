kind: manual

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
  type: build
- filename: components/perl.bst
  type: build

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
  ref: libreoffice-24.2.0.2-0-g4e123a7bcb22986e6d3a646098becd31bcb55c50
- kind: local
  path: files/dictionaries/install_dicts.py
- kind: local
  path: files/dictionaries/th_gen_idx.pl
