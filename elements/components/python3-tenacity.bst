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
    sha256sum: cd80a53a79336edba8489e767f729e4f391c896956b57140b5d7511a64bbd3ef
    suffix: 
      9a/dc/7b9818743ab08d53245b777639b6c2d274be8e7eb09b1131885958a3f517/tenacity-8.4.2.tar.gz
