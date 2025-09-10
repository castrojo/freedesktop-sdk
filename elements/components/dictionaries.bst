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
  ref: libreoffice-25.8.1.1-0-g465c2fca4f8b3b22321d5f3e5d5d4fc92f335a20
- kind: local
  path: files/dictionaries/install_dicts.py
- kind: local
  path: files/dictionaries/th_gen_idx.pl
