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
- kind: git_repo
  url: github:hunspell/hyphen.git
  track: v*.*.*
  ref: v2.8.9-0-g27439e9d339a05841cab9e661a1bbb8ca6ff1b02
