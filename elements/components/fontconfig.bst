kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/gperf.bst

depends:
- bootstrap-import.bst
- components/freetype.bst

variables:
  conf-local: >-
    --with-templatedir="%{sysconfdir}/fonts/conf.avail"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libfontconfig.so'

    integration-commands:
    - |
      if [ -d "%{datadir}/fonts" ]; then
        touch -d @0 "%{datadir}/fonts" /usr/share/fonts/*
        fc-cache -rs
      fi

sources:
- kind: git_repo
  url: freedesktop:fontconfig/fontconfig.git
  track: '*.*.*'
  exclude:
  - 2.*.9*
  ref: 2.15.0-0-g72b9a48f57de6204d99ce1c217b5609ee92ece9b
