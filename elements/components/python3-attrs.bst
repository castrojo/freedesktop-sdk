kind: pip

depends:
- components/python3.bst
- components/python3-hatchling.bst
- components/python3-hatch-vcs.bst
- components/python3-hatch-fancy-pypi-readme.bst

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

sources:
- kind: pypi
  name: attrs
  ref:
    sha256sum: 5cfb1b9148b5b086569baec03f20d7b6bf3bcacc9a42bebf87ffaaca362f6346
    suffix: 
      fc/0f/aafca9af9315aee06a89ffde799a10a582fe8de76c563ee80bbcdc08b3fb/attrs-24.2.0.tar.gz
