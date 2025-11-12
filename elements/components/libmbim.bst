kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/bash-completion.bst
- components/gobject-introspection.bst
- components/gtk-doc.bst
- components/help2man.bst

depends:
- public-stacks/runtime-minimal.bst
- components/glib.bst
- components/libgudev.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libmbim-glib.so'

sources:
- kind: git_repo
  url: freedesktop:mobile-broadband/libmbim.git
  track: '*.*.*'
  exclude:
  - '*-dev'
  ref: 1.32.0-0-g2bc1080292aae30000e808ec77d7a99b87eb3553
