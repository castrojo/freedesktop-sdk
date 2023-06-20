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
    sha256sum: 1444d52f1bb4cc79a4a0c0fe2ccec4bd78ff885ab01ebe1c0f637d8392bcafb6
    suffix: a2/dd/bc2c9ee9485308a29c18b1241329e677917af25c60b127857f0fb23d0c6e/pycairo-1.24.0.tar.gz
