kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection.bst
- components/gperf.bst

depends:
- bootstrap-import.bst
- components/curl.bst
- components/gcab.bst
- components/gdk-pixbuf.bst
- components/libarchive.bst
- components/json-glib.bst

variables:
  meson-local: >-
    -Dfonts=false
    -Ddep11=false
    -Drpm=false

config:
  install-commands:
    (>):
    - |
      rm -r "%{install-root}%{datadir}/installed-tests"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libappstream-glib.so'

  cpe:
    version-match: '(\d+)_(\d+)_(\d+)'

sources:
- kind: git_repo
  url: github:hughsie/appstream-glib.git
  track: appstream_glib_*
  ref: appstream_glib_0_8_3-0-g830cdbd0581110bdb74188e7a66c272cd059f5bb
