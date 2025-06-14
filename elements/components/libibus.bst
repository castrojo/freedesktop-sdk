kind: autotools

build-depends:
- components/gobject-introspection.bst
- components/wayland-protocols.bst
- public-stacks/buildsystem-autotools.bst
- components/iso-codes.bst
- components/systemd.bst
- components/vala.bst
- components/gtk-doc.bst

depends:
- components/gtk3.bst

variables:
  conf-local: >-
    --disable-xim
    --disable-dconf
    --disable-memconf
    --disable-schemas-compile
    --disable-gtk2
    --disable-gtk4
    --disable-setup
    --disable-ui
    --disable-engine
    --disable-python-library
    --disable-emoji-dict
    --disable-appindicator
    --disable-glibtest
    --disable-tests
    --disable-unicode-dict
    --disable-python2
    --disable-libnotify
    --disable-systemd-services

config:
  install-commands:
    (>):
    - |
      rm -r "%{install-root}%{bindir}"
      rm -r "%{install-root}%{datadir}/bash-completion"
      rm -r "%{install-root}%{datadir}/dbus-1"
      rm -r "%{install-root}%{datadir}/icons"
      rm -r "%{install-root}%{datadir}/man"
      rm -r "%{install-root}%{datadir}/gettext"
      rm -r "%{install-root}%{datadir}/locale"
      rm -r "%{install-root}%{libexecdir}"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libibus-1.0.so'

sources:
- kind: git_repo
  url: github:ibus/ibus.git
  track: "*.*.*"
  exclude:
  - "*rc*"
  - "*beta*"
  ref: 1.5.32-0-g0fd4e408a52d3d15179c643fd54d310aafd8875f
