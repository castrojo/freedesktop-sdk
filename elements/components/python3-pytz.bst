kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: pytz
  ref:
    sha256sum: 31d4583c4ed539cd037956140d695e42c033a19e984bfce9964a3f7d59bc2b40
    suffix: 
      ae/fd/c5bafe60236bc2a464452f916b6a1806257109c8954d6a7d19e5d4fb012f/pytz-2023.4.tar.gz
