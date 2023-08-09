kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: sphinxcontrib-devhelp
  ref:
    sha256sum: ced21e99bceed8694117b8361b67df624d8788309399f24bd948a254e64cc017
    suffix: 4e/f8/89ea346f98f51eab08b160b8cc95e13e71eb7f4bed74a70074fbd0c2f5e5/sphinxcontrib_devhelp-1.0.3.tar.gz
