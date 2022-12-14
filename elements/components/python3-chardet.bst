kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: chardet
  ref:
    sha256sum: 0d62712b956bc154f85fb0a266e2a3c5913c2967e00348701b32411d6def31e5
    suffix: 41/32/cdc91dcf83849c7385bf8e2a5693d87376536ed000807fa07f5eab33430d/chardet-5.1.0.tar.gz
