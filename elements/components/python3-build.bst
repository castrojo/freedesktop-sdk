kind: pyproject

build-depends:
- components/python3-installer.bst
- components/python3-setuptools.bst
- components/python3-wheel.bst

depends:
- components/python3.bst
- components/python3-packaging.bst
- components/python3-pep517.bst

environment:
  PYTHONPATH: "%{build-root}/src"

sources:
- kind: pypi
  name: build
  ref:
    sha256sum: 1a07724e891cbd898923145eb7752ee7653674c511378eb9c7691aab1612bc3c
    suffix: 0f/61/aaf43fbb36cc4308be8ac8088f52db9622b0dbf1f0880c1016ae6aa03f46/build-0.9.0.tar.gz
