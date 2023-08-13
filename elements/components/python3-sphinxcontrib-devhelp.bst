kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: sphinxcontrib-devhelp
  ref:
    sha256sum: 4fd751c63dc40895ac8740948f26bf1a3c87e4e441cc008672abd1cb2bc8a3d1
    suffix: 52/14/35164e8fd79b8ec7f9570984ab4af38f2ec728084df7ddd3c4b045e6b63a/sphinxcontrib_devhelp-1.0.4.tar.gz
