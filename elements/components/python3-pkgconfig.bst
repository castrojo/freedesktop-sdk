kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-poetry-core.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: pkgconfig
  include:
  - '1.5.*'
  ref:
    sha256sum: deb4163ef11f75b520d822d9505c1f462761b4309b1bb713d08689759ea8b899
    suffix: c4/e0/e05fee8b5425db6f83237128742e7e5ef26219b687ab8f0d41ed0422125e/pkgconfig-1.5.5.tar.gz
