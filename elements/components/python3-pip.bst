kind: distutils

depends:
- bootstrap-import.bst
- components/python3.bst
- components/python3-setuptools.bst

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{bindir}/pip"

sources:
- kind: pypi
  name: pip
  include:
  - '23.0.*'
  ref:
    sha256sum: cd015ea1bfb0fcef59d8a286c1f8bebcb983f6317719d415dc5351efb7cd7024
    suffix: 6b/8b/0b16094553ecc680e43ded8f920c3873b01b1da79a54274c98f08cb29fca/pip-23.0.1.tar.gz
