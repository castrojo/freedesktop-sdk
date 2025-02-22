kind: script

build-depends:
- components/libdrm.bst
- extensions/mesa/libdrm.bst
- components/libabigail.bst

config:
  commands:
  - abidiff '%{libdir}/libdrm.so' '%{libdir}/GL/default/lib/libdrm.so.2'
