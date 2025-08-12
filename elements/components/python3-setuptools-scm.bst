kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst
- components/python3-setuptools.bst
- components/git-minimal.bst
- components/python3-typing-extensions.bst
- components/python3-packaging.bst

sources:
- kind: pypi
  name: setuptools_scm
  ref:
    sha256sum: 9b47bba73d1dcf0074b043f0ece0c4e485d87e0a73803c9176797ab68d0c3015
    suffix: 
      52/92/6e70871d658cd6a7d5ac66342a7b3d2e6e0af945b17ba1167abc9c36a463/setuptools_scm-9.1.1.tar.gz
