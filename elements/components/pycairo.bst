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
    sha256sum: b34517abdf619d4c7f0274f012b398d9b03bab7adc3efd2912bf36be3f911f3f
    suffix: e5/9f/541adc3a06ea28369c4ab52d2cf95597bb2ef626b3cf1c61afa26f735461/pycairo-1.22.0.tar.gz
