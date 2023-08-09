kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: sphinxcontrib-applehelp
  ref:
    sha256sum: e58ca6b828d1c9ef3f8b51ff5bfe989507399977da1bb389b393199d45066357
    suffix: e9/05/03f628e210c2ac8f40041f31800f7b6957dd94b845979ba76ee4e1c98f0c/sphinxcontrib_applehelp-1.0.5.tar.gz
