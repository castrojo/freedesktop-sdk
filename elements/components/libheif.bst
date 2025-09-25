kind: cmake

(@):
- elements/include/libheif.yml

variables:
  cmake-extra: >-
    -DWITH_GDK_PIXBUF=OFF
    -DWITH_X265=OFF
    -DWITH_LIBDE265=OFF

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libheif.so'
