kind: filter

build-depends:
- components/polkit-base.bst

runtime-depends:
- public-stacks/runtime-minimal.bst
- components/glib.bst
- components/polkit-manifest.bst
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
