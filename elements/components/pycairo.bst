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
    sha256sum: 5cb21e7a00a2afcafea7f14390235be33497a2cce53a98a19389492a60628430
    suffix: 
      07/4a/42b26390181a7517718600fa7d98b951da20be982a50cd4afb3d46c2e603/pycairo-1.27.0.tar.gz
