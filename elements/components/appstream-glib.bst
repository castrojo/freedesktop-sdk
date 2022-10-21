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
    -Dstemmer=false

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
- kind: git_tag
  url: github:hughsie/appstream-glib.git
  track: master
  ref: appstream_glib_0_8_1-0-g28c985bec286385504c5303a8f29eab4082f5afd
