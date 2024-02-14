kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- components/cairo.bst
- components/python3.bst

sources:
- kind: pypi
  name: pycairo
  include:
  - '1.25.*'
  ref:
    sha256sum: 7e2be4fbc3b4536f16db7a11982cbf713e75069a4d73d44fe5a49b68423f5c0c
    suffix: 
      c7/7c/de4d40316ee563e4f15a0f05f28c8458833fbef80c4588b9dd51f39b78ee/pycairo-1.25.1.tar.gz
