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
    sha256sum: a43bcd8910406e0884ca0db3db7bed581f389c1d05165e992a1ddabfc81df05e
    suffix: f9/c2/99cfbad6405afeb9fc2aa2df4d8a4c96b91b83315b17060c101f3c260736/tenacity-8.2.0.tar.gz
