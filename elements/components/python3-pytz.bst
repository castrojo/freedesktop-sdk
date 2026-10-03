kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: pytz
  ref:
    sha256sum: 464303645bafafd72418898368b2429458f709cf1eb6a15372fbcc396b64da63
    suffix: b0/ed/fa23d28713004418bbf2407127f80f385bfb0bf4e677bef02c25c27b00ee/pytz-2026.4.tar.gz
