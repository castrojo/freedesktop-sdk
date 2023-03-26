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
    sha256sum: 43af037822bd0029025877f3b2d97cc4d7bb0c2991000a3d59d71517c5c969e0
    suffix: d3/f0/6ccd8854f4421ce1f227caf3421d9be2979aa046939268c9300030c0d250/tenacity-8.2.2.tar.gz
