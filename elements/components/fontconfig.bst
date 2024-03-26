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
      install -m 0644 -p -T fontconfig-flatpak-fontpath.conf %{install-root}%{sysconfdir}/fonts/conf.d/05-flatpak-fontpath.conf

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
  ref: 2.14.1-0-gc45e09df1ef235d653d56aef05012f6a3cc57979
- kind: patch
  path: patches/fontconfig/mr-244.patch
- kind: local
  path: files/fontconfig-flatpak.conf
- kind: local
  path: files/fontconfig-flatpak-fontpath.conf
