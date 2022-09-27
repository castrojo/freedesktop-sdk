kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst
- components/python3-setuptools-scm.bst

sources:
- kind: pypi
  name: tenacity
  ref:
    sha256sum: e48c437fdf9340f5666b92cd7990e96bc5fc955e1298baf4a907e3972067a445
    suffix: ae/9c/ce67f96abe7c7530173e746b4f16a0bc5b4fa962ea1080d80cc5757dd210/tenacity-8.1.0.tar.gz
