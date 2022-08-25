kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-sphinx.bst
- components/python3-setuptools-pep8.bst
- components/python3-setuptools-git.bst
- components/python3-six.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: dbus-deviation
  ref:
    sha256sum: e06b88efe223885d2725df51cf7c9b7b463d1c6f04ea49d4690874318d0eb7a3
    suffix: 01/dc/047feaa6a81545e10c37d4eeff86443c90dd114c5ce13d6937c5ed38854d/dbus-deviation-0.6.1.tar.gz
