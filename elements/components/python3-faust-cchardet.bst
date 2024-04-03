kind: pip

build-depends:
- components/python3-pip.bst
- components/cython.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: faust-cchardet
  ref:
    sha256sum: f89386297cde0c8e0f5e21464bc2d6d0e4a4fc1b1d77cdb238ca24d740d872e0
    suffix: e9/53/2125d17d7c2a14b76303bf5c3c5db35ea8e4b8a14817bb191c601d67e288/faust-cchardet-2.1.19.tar.gz
