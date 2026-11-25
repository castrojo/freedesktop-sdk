kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-pytz.bst

sources:
- kind: pypi
  name: babel
  ref:
    sha256sum: fddd2cbbbac7c299af3c2880be23609c331bd94f0912baca6cb0abfe054dfc27
    suffix: 32/44/744169ce3677a541439bc9506ef08bd85674e9d6e3895ebe5a87ff65fb7a/babel-2.19.0.tar.gz
