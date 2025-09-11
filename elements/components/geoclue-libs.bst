kind: filter

build-depends:
- components/geoclue-base.bst

runtime-depends:
- components/json-glib.bst
- components/glib.bst
- components/libsoup.bst
- components/geoclue-manifest.bst

config:
  include:
  - libgeoclue
  - geoclue-license

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgeoclue-2.so'
