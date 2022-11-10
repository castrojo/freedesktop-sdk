kind: pip

depends:
- bootstrap-import.bst
- components/python3.bst
- components/python3-setuptools.bst

build-depends:
- components/python3-pip.bst

sources:
- kind: pypi
  name: wheel
  ref:
    sha256sum: 965f5259b566725405b05e7cf774052044b1ed30119b5d586b2703aafe8719ac
    suffix: a2/b8/6a06ff0f13a00fc3c3e7d222a995526cbca26c1ad107691b6b1badbbabf1/wheel-0.38.4.tar.gz
