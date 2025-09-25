kind: cmake

(@):
- elements/include/libheif.yml

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libheif.so'
