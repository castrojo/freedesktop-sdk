kind: pip

depends:
- filename: components/python3.bst

build-depends:
- filename: bootstrap-import.bst
- filename: components/python3-pip.bst

config:
  install-commands:
    (>):
    - |
      for f in "%{install-root}%{bindir}/"*.py; do
        ln -s "$(basename "${f}")" "%{install-root}%{bindir}/$(basename "${f}" .py)"
      done

sources:
- kind: pypi
  name: docutils
  ref:
    sha256sum: f08a4e276c3a1583a86dce3e34aba3fe04d02bba2dd51ed16106244e8a923e3b
    suffix: 
      1f/53/a5da4f2c5739cf66290fac1431ee52aff6851c7c8ffd8264f13affd7bcdd/docutils-0.20.1.tar.gz
