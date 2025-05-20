kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: pluggy
  ref:
    sha256sum: 7dcc130b76258d33b90f61b658791dede3486c3e6bfb003ee5c9bfb396dd22f3
    suffix: 
      f9/e2/3e91f31a7d2b083fe6ef3fa267035b518369d9511ffab804f839851d2779/pluggy-1.6.0.tar.gz
