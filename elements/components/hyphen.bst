kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/patch.bst
- components/perl.bst

depends:
- public-stacks/runtime-minimal.bst

config:
  install-commands:
    (>):
      # Dictionaries will be installed by components/dictionaries.bst
    - |
      rm -f %{install-root}%{datadir}/hyphen/hyph_en_US.dic

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libhyphen.so'

sources:
- kind: tar
  url: sourceforge_download:hunspell/hyphen-2.8.8.tar.gz
  ref: 304636d4eccd81a14b6914d07b84c79ebb815288c76fe027b9ebff6ff24d5705
