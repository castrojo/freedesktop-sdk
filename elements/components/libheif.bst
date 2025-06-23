kind: cmake-recc

(@):
- elements/include/libheif.yml

variables:
  cmake-extra: >-
    -DWITH_GDK_PIXBUF=ON
    -DWITH_X265=OFF
    -DWITH_LIBDE265=OFF

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
