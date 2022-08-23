kind: pip

depends:
- bootstrap-import.bst
- components/python3.bst
- components/python3-setuptools.bst

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

sources:
- kind: pypi
  name: meson
  include:
  - 0\.59\..*
  ref:
    sha256sum: a77988cc50554f73ede075bc9bf77a2d7ecb6ff892f2a0180d4940920eaaec84
    suffix: 57/90/1f5768627ef72e95483b2a899f5efc6efa6c999966b2a1a5ba2d1de6db9c/meson-0.59.4.tar.gz
- kind: patch
  path: patches/meson/meson-no-lib64.patch
