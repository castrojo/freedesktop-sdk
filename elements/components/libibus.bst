# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/gobject-introspection.bst
- components/gtk-doc.bst
- components/iso-codes.bst
- components/systemd.bst
- components/vala.bst
- components/wayland-protocols.bst

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
  - "*alpha*"
  ref: 1.5.34-0-g1f7af28437afd62a6d145bfc81035e698a37411d
