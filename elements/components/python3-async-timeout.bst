kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: async-timeout
  ref:
    sha256sum: d9321a7a3d5a6a5e187e824d2fa0793ce379a202935782d555d6e9d2735677d3
    suffix: 
      a5/ae/136395dfbfe00dfc94da3f3e136d0b13f394cba8f4841120e34226265780/async_timeout-5.0.1.tar.gz
