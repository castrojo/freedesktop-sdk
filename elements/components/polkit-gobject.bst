kind: filter

build-depends:
- components/polkit-base.bst

runtime-depends:
- bootstrap-import.bst
- components/glib.bst
- components/systemd-libs.bst

config:
  include:
  - polkit-gobject

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpolkit-gobject-1.so'
