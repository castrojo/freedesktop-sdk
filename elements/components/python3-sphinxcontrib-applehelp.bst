kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-flit-core.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: sphinxcontrib-applehelp
  ref:
    sha256sum: c40a4f96f3776c4393d933412053962fac2b84f4c99a7982ba42e09576a70619
    suffix: 
      26/6b/68f470fc337ed24043fec987b101f25b35010970bd958970c2ae5990859f/sphinxcontrib_applehelp-1.0.8.tar.gz
