kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst
- components/cython.bst

sources:
- kind: pypi
  name: multidict
  ref:
    sha256sum: 5ff3bd75f38e4c43f1f470f2df7a4d430b821c4ce22be384e1459cb57d6bb013
    suffix: fa/a7/71c253cdb8a1528802bac7503bf82fe674367e4055b09c28846fdfa4ab90/multidict-6.0.2.tar.gz
