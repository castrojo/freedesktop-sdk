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
    sha256sum: 9b61ac818723adc04367301317eb2e814a83522f07bbd1f409af0dada463c44c
    suffix: 69/ca/9e9fa2e8be0876a9bbf046a1be7ee33e61d4fdfbd1fd25c76c1bdfddf8c4/pycairo-1.23.0.tar.gz
