kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/gperf.bst

depends:
- public-stacks/runtime-minimal.bst
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
  ref: 2.16.0-0-g127bb4dbfca7ba669eb40212ffcf24dd8f30351b
