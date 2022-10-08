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
    - |
      python3 << EOF
      import importlib.metadata
      importlib.metadata.requires('sphinx')
      EOF

sources:
- kind: pypi
  name: sphinx
  ref:
    sha256sum: 5b10cb1022dac8c035f75767799c39217a05fc0fe2d6fe5597560d38e44f0363
    suffix: 38/f2/09c2c9c59eabf25e1b2d391dc5e0438689fbb0d973fff6350f7c7521dbd0/Sphinx-5.2.3.tar.gz
