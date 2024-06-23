kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- components/cairo.bst
- components/python3.bst

sources:
- kind: pypi
  name: pycairo
  ref:
    sha256sum: a11b999ce55b798dbf13516ab038e0ce8b6ec299b208d7c4e767a6f7e68e8430
    suffix: 
      19/4f/0d48a017090d4527e921d6892bc550ae869902e67859fc960f8fe63a9094/pycairo-1.26.1.tar.gz
