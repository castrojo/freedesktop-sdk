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

config:
  install-commands:
    (>):
    - |
      install -m 0644 -p -T fontconfig-flatpak.conf %{install-root}%{sysconfdir}/fonts/conf.d/50-flatpak.conf

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
- kind: git_tag
  url: freedesktop:fontconfig/fontconfig.git
  track: main
  exclude:
  - 2.*.9*
  ref: 2.14.0-0-g911b19f19f1334d51c452756f9ce222c1101097b
- kind: local
  path: files/fontconfig-flatpak.conf
- kind: patch
  path: patches/fontconfig/font-remapping.patch
