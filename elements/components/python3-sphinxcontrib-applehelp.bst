kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: sphinxcontrib-applehelp
  ref:
    sha256sum: 2f29ef331735ce958efa4734873f084941970894c6090408b079c61b2e1c06d1
    suffix: 
      ba/6e/b837e84a1a704953c62ef8776d45c3e8d759876b4a84fe14eba2859106fe/sphinxcontrib_applehelp-2.0.0.tar.gz
