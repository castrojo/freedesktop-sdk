kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-flit-core.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-alabaster.bst
- components/python3-babel.bst
- components/python3-docutils.bst
- components/python3-imagesize.bst
- components/python3-importlib-metadata.bst
- components/python3-jinja2.bst
- components/python3-packaging.bst
- components/python3-pygments.bst
- components/python3-requests.bst
- components/python3-setuptools.bst
- components/python3-snowballstemmer.bst
- components/python3-sphinxcontrib-applehelp.bst
- components/python3-sphinxcontrib-devhelp.bst
- components/python3-sphinxcontrib-htmlhelp.bst
- components/python3-sphinxcontrib-jsmath.bst
- components/python3-sphinxcontrib-qthelp.bst
- components/python3-sphinxcontrib-serializinghtml.bst

public:
  bst:
    integration-commands:
    - python3 -c "import pkg_resources; pkg_resources.require('sphinx')"

sources:
- kind: pypi
  name: sphinx
  ref:
    sha256sum: 780f4d32f1d7d1126576e0e5ecc19dc32ab76cd24e950228dcf7b1f6d3d9e22f
    suffix: dc/01/688bdf9282241dca09fe6e3a1110eda399fa9b10d0672db609e37c2e7a39/sphinx-7.1.2.tar.gz
