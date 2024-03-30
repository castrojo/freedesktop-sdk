kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-pyasn1.bst

sources:
- kind: pypi
  name: pyasn1-modules
  ref:
    sha256sum: 831dbcea1b177b28c9baddf4c6d1013c24c3accd14a1873fffaa6a2e905f17b6
    suffix: 
      f7/00/e7bd1dec10667e3f2be602686537969a7ac92b0a7c5165be2e5875dc3971/pyasn1_modules-0.4.0.tar.gz
