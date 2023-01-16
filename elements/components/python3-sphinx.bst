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
    sha256sum: 0dac3b698538ffef41716cf97ba26c1c7788dba73ce6f150c1ff5b4720786dd2
    suffix: db/0b/a0f60c4abd8a69bd5b0d20edde8a8d8d9d4ca825bbd920d328d248fd0290/Sphinx-6.1.3.tar.gz
