kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection.bst
- components/gtk-doc.bst
- components/help2man.bst

depends:
- public-stacks/runtime-minimal.bst
- components/bash-completion.bst
- components/glib.bst
- components/libgudev.bst
- components/libmbim.bst
- components/libqrtr-glib.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libqmi-glib.so'

sources:
- kind: git_repo
  url: freedesktop:mobile-broadband/libqmi.git
  track: '*.*.*'
  exclude:
  - '*-dev'
  ref: 1.36.0-0-gdefb13dcab0adc7f44f6741807244507a14a30c5
