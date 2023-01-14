kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: alabaster
  ref:
    sha256sum: a27a4a084d5e690e16e01e03ad2b2e552c61a65469419b907243193de1a84ae2
    suffix: 94/71/a8ee96d1fd95ca04a0d2e2d9c4081dac4c2d2b12f7ddb899c8cb9bfd1532/alabaster-0.7.13.tar.gz
