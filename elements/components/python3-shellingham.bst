kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: shellingham
  ref:
    sha256sum: 41bc81fa8d74afb04338e0398f9732ee2217407ade778ae1e2709bde89d85c45
    suffix: 1b/b5/8a4ebd9108ab4f78e697a901969f3c3bf27afddf734a4b8a2e7dd7d440e3/shellingham-1.5.1.tar.gz
