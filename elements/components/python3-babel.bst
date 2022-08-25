kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-pytz.bst

sources:
- kind: pypi
  name: babel
  ref:
    sha256sum: 7614553711ee97490f732126dc077f8d0ae084ebc6a96e23db1482afabdb2c51
    suffix: 51/27/81e9cf804a34a550a47cc2f0f57fe4935281d479ae3a0ac093d69476f221/Babel-2.10.3.tar.gz
