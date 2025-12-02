kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst
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
- components/python3-roman-numerals.bst

variables:
  strip-binaries: ''

public:
  bst:
    integration-commands:
    - |
      python3 << EOF
      import importlib.metadata
      importlib.metadata.requires('sphinx')
      EOF

sources:
- kind: git_repo
  url: github:sphinx-doc/sphinx.git
  track: v*
  exclude:
  - "*rc*"
  ref: v9.0.0-0-gaea90c92aadb186b82e96c2b7ad6f2b865f70df1
