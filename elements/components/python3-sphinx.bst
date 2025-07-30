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
- components/python3-roman-numerals-py.bst

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
  ref: v8.2.3-0-g847ad0c991e21db9daa02fec09acbd456f353300
- kind: patch
  path: patches/python3-sphinx/docutils.patch
