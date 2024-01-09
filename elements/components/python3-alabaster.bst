kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-flit-core.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: alabaster
  ref:
    sha256sum: 0127f4b1db0afc914883f930e3d40763131aebac295522fc4a04d9e77c703705
    suffix: 
      62/03/9365dc7e96ac2e3f9b5019c55eb5283aac96adffc0ca445ab6c80952fae6/alabaster-0.7.15.tar.gz
