kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst


depends:
- components/python3.bst

sources:
- kind: pypi
  name: urllib3
  ref:
    sha256sum: c083dd0dce68dbfbe1129d5271cb90f9447dea7d52097c6e0126120c521ddea8
    suffix: c2/51/32da03cf19d17d46cce5c731967bf58de9bd71db3a379932f53b094deda4/urllib3-1.26.13.tar.gz
