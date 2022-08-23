kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: cachy
  ref:
    sha256sum: 186581f4ceb42a0bbe040c407da73c14092379b1e4c0e327fdb72ae4a9b269b1
    suffix: a0/0c/45b249b0efce50a430b8810ec34c5f338d853c31c24b0b297597fd28edda/cachy-0.3.0.tar.gz
- kind: patch
  path: patches/python3-cachy/no-install-tests.patch
