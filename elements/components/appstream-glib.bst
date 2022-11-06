kind: meson

depends:
- filename: bootstrap-import.bst
- filename: components/libsoup.bst
- filename: components/json-glib.bst
- filename: components/gdk-pixbuf.bst
- filename: components/gcab.bst
- filename: components/gobject-introspection.bst
  type: build
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/gperf.bst
  type: build
- filename: components/libarchive.bst

variables:
  meson-local: |
    -Dfonts=false \
    -Ddep11=false \
    -Drpm=false \
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
  track: 0_7_X
  ref: appstream_glib_0_7_18-0-g705e8e2061e9c9ef741792b1de56c6529fb57082
