kind: cmake

(@):
- elements/include/libheif.yml
- elements/extensions/codecs-extra/config.yml

depends:
  (>):
  - extensions/codecs-extra/libde265.bst
  - extensions/codecs-extra/libx265.bst

variables:
  cmake-extra: >-
    -DWITH_GDK_PIXBUF=OFF
    -DLIBDE265_INCLUDE_DIR="%{prefix}/include"
    -DLIBDE265_PKGCONF_LIBRARY_DIRS="%{prefix}"
    -DX265_INCLUDE_DIR="%{prefix}/include"
    -DX265_PKGCONF_LIBRARY_DIRS="%{prefix}"

config:
  install-commands:
    (>):
    - rm -v "%{install-root}%{prefix}/libheif.so"
    - rm -v "%{install-root}%{prefix}/"libheif.so.*
    - |
      for f in "%{install-root}%{prefix}/libheif/"libheif-{libde265,x265}.so; do
        if [ ! -e "${f}" ]; then
           echo "Expected ${f} to be present"
           exit 1
        fi
      done
