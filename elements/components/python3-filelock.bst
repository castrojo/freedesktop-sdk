kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: filelock
  ref:
    sha256sum: 7565f628ea56bfcd8e54e42bdc55da899c85c1abfe1b5bcfd147e9188cebb3b2
    suffix: d8/73/292d9ea2370840a163e6dd2d2816a571244e9335e2f6ad957bf0527c492f/filelock-3.8.2.tar.gz
