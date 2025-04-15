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
    sha256sum: 26ec5c6126781eb167089a123919f87baa2740da2cca9098be8b3a6b91cc5fbc
    suffix: 
      40/d9/412da520de9052b7e80bfc810ec10f5cb3dbfa4aa3e23c2820dc61cdb3d0/pycairo-1.28.0.tar.gz
