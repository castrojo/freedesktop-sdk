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
  ref: libreoffice-7.6.1.2-0-g69b9c19e7daa4224765023f007e9694cd9456a76
- kind: local
  path: files/dictionaries/install_dicts.py
- kind: local
  path: files/dictionaries/th_gen_idx.pl
