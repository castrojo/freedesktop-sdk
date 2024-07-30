kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: sphinxcontrib-htmlhelp
  ref:
    sha256sum: c9e2916ace8aad64cc13a0d233ee22317f2b9025b9cf3295249fa985cc7082e9
    suffix: 
      43/93/983afd9aa001e5201eab16b5a444ed5b9b0a7a010541e0ddfbbfd0b2470c/sphinxcontrib_htmlhelp-2.1.0.tar.gz
