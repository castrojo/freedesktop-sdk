kind: manual

build-depends:
- components/findutils.bst
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
  ref: libreoffice-26.8.2.1-0-gfa8f3d19d7013d2a80b88e126514aef0db2699c1
- kind: local
  path: files/dictionaries/install_dicts.py
- kind: local
  path: files/dictionaries/th_gen_idx.pl
