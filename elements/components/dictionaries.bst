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
  ref: libreoffice-24.2.3.1-0-g698c450f83ed54b725710945fce13b9d45912eaa
- kind: local
  path: files/dictionaries/install_dicts.py
- kind: local
  path: files/dictionaries/th_gen_idx.pl
