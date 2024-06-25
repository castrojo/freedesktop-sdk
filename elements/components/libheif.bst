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
        - '%{libdir}/cmake'
        - '%{libdir}/cmake/**'


