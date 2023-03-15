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
  ref: 2.14.2-0-g7861a719616b4b132b9cac089c6c64f47832edb1
