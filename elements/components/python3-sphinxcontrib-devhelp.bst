kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-flit-core.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: sphinxcontrib-devhelp
  ref:
    sha256sum: 411f5d96d445d1d73bb5d52133377b4248ec79db5c793ce7dbe59e074b4dd1ad
    suffix: 
      f6/d2/5beee64d3e4e747f316bae86b55943f51e82bb86ecd325883ef65741e7da/sphinxcontrib_devhelp-2.0.0.tar.gz
