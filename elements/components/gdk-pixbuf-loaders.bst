kind: stack

depends:
- components/gdk-pixbuf.bst
- components/libavif.bst
- components/libjxl.bst
- components/webp-pixbuf-loader.bst


public:
  bst:
    integration-commands:
    - |
      gdk-pixbuf-query-loaders --update-cache
