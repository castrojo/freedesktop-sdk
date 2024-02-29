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
  ref: libreoffice-24.2.1.2-0-g0baeab5a9e584d1b699bef69e49a9074137be365
- kind: local
  path: files/dictionaries/install_dicts.py
- kind: local
  path: files/dictionaries/th_gen_idx.pl
