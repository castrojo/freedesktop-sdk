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
    sha256sum: 2dddd0a874fbddb21e14acd9b955881ee1dc6e63b9c549a192d613a907f9cbeb
    suffix: 
      1c/41/91955188e97c7b85fbaac6bbf4e33de028899e0aa31bdce99b1afe2eeb17/pycairo-1.26.0.tar.gz
