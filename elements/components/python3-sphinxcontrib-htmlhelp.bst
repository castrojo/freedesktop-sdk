kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-flit-core.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: sphinxcontrib-htmlhelp
  ref:
    sha256sum: 0dc87637d5de53dd5eec3a6a01753b1ccf99494bd756aafecd74b4fa9e729015
    suffix: 
      8a/03/2f9d699fbfdf03ecb3b6d0e2a268a8998d009f2a9f699c2dcc936899257d/sphinxcontrib_htmlhelp-2.0.5.tar.gz
