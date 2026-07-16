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

  - |
    %{install-extra}
    DIR="%{install-root}%{project_licensedir}/dictionaries"
    mkdir -p "$DIR"
    find . \( -iname "readme*" -o -iname "copying*" -o -iname "licen*" \) \
      -exec cp --parents -t "$DIR" {} +

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
  ref: libreoffice-26.8.0.1-0-gb458da6da6285dcc1f13b916b1f225d589366b99
- kind: local
  path: files/dictionaries/install_dicts.py
- kind: local
  path: files/dictionaries/th_gen_idx.pl
