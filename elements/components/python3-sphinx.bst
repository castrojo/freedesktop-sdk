kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

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
    sha256sum: 43c911f997a4530b6cffd4ff8d5516591f6c60d178591f4406f0dd02282e3f64
    suffix: 
      5d/0f/89931681be5d22bf76d1987fa4d0784e06c136cc51356d6b7fda7132ff90/sphinx-7.4.4.tar.gz
