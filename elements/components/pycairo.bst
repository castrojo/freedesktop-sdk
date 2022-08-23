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
    sha256sum: 251907f18a552df938aa3386657ff4b5a4937dde70e11aa042bc297957f4b74b
    suffix: 92/a4/506564f574fa74c90b98690e8ecc8dbae1629f31fcfe0be69de45d9e1605/pycairo-1.21.0.tar.gz
