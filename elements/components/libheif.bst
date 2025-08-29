kind: cmake

(@):
- elements/include/libheif.yml

variables:
  cmake-extra: >-
    -DWITH_GDK_PIXBUF=ON

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libheif.so'
      pixbufloader:
      - "%{libdir}/gdk-pixbuf-2.0"
      - "%{libdir}/gdk-pixbuf-2.0/**"
      - "%{debugdir}%{libdir}/gdk-pixbuf-2.0"
      - "%{debugdir}%{libdir}/gdk-pixbuf-2.0/**"
      - "%{sourcedir}/%{element-name}/gdk-pixbuf"
      - "%{sourcedir}/%{element-name}/gdk-pixbuf/**"
