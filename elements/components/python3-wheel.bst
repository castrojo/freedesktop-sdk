kind: pyproject

build-depends:
- components/python3-build.bst
- components/python3-installer.bst

depends:
- components/python3.bst
- components/python3-setuptools.bst

environment:
  PYTHONPATH: src

sources:
- kind: pypi
  name: wheel
  ref:
    sha256sum: 965f5259b566725405b05e7cf774052044b1ed30119b5d586b2703aafe8719ac
    suffix: a2/b8/6a06ff0f13a00fc3c3e7d222a995526cbca26c1ad107691b6b1badbbabf1/wheel-0.38.4.tar.gz
- kind: local
  path: files/python3-wheel/pyproject.toml
