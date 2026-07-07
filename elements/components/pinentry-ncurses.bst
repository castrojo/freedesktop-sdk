kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/texinfo.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libassuan.bst
- components/libgpg-error.bst

variables:
  autogen: autoreconf -vif -I %{datadir}/gettext/m4
  conf-local: >-
    --enable-pinentry-curses
    --disable-pinentry-qt
    --disable-pinentry-gtk2
    --disable-pinentry-gnome3
    --disable-pinentry-fltk

config:
  build-commands:
    (<):
    - make -C "%{build-dir}/doc" ../../doc/stamp-vti

  install-commands:
    (>):
    - rm "%{install-root}%{bindir}/pinentry"

public:
  bst:
    integration-commands:
    # KDE images should provide qt, GNOME images should provide gnome3.
    # So we enable ncurses only if no other pinentry is already enabled.
    - |
      [ -x "%{bindir}/pinentry" ] || ln -s pinentry-curses "%{bindir}/pinentry"

sources:
- kind: git_repo
  url: github:gpg/pinentry.git
  track: pinentry-*
  exclude:
  - '*-base'
  ref: pinentry-1.3.3-0-g9a7b78e9882b8261b0be439cccf5651b9dd971a8
