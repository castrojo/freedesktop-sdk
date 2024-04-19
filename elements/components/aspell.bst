kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/perl.bst
- components/texinfo.bst

depends:
- bootstrap-import.bst

variables:
  conf-local: >-
    --enable-curses="-ltinfow -lncursesw"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/pspell-config'
        - '%{libdir}/libaspell.so'
        - '%{libdir}/libpspell.so'
  cpe:
    patches:
    - CVE-2019-25051

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

sources:
- kind: git_repo
  url: savannah:aspell.git
  track: rel-*
  exclude:
  - 'rel-*-*'
  ref: rel-0.60.8.1-0-g061f2e450d41808f7bd8c6eb84b2256455ae8c26
