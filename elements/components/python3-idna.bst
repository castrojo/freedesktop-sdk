kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst
- components/python3-flit-core.bst

sources:
- kind: pypi
  name: idna
  ref:
    sha256sum: 028ff3aadf0609c1fd278d8ea3089299412a7a8b9bd005dd08b9f8285bcb5cfc
    suffix: 
      21/ed/f86a79a07470cb07819390452f178b3bef1d375f2ec021ecfc709fc7cf07/idna-3.7.tar.gz
