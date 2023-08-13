kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: sphinxcontrib-qthelp
  ref:
    sha256sum: d31d1a1beaf3894866bb318fb712f1edc82687f1c06235a01e5b2c50c36d5c40
    suffix: 43/7c/188a654c6eecc132b521e8718cc65d8364d89d18ceda2dcfaaecd5c6a5aa/sphinxcontrib_qthelp-1.0.5.tar.gz
