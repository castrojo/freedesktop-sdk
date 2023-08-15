kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: sphinxcontrib-qthelp
  ref:
    sha256sum: 62b9d1a186ab7f5ee3356d906f648cacb7a6bdb94d201ee7adf26db55092982d
    suffix: 4f/a2/53129fc967ac8402d5e4e83e23c959c3f7a07362ec154bdb2e197d8cc270/sphinxcontrib_qthelp-1.0.6.tar.gz
