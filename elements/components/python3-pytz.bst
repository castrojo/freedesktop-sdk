kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: pytz
  ref:
    sha256sum: c4d88f472f54d615e9cd582a5004d1e5f624854a6a27a6211591c251f22a6914
    suffix: fe/dd/182cc5ed8e64a0d6d6c34fd27391041d542270000825410d294bd6902207/pytz-2022.5.tar.gz
