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
    sha256sum: 33995a6753c30b7f577febfc2c50411fec6aac7f7ffeb7c4cfe5991072dcf9e6
    suffix: 6b/5c/330ea8d383eb2ce973df34d1239b3b21e91cd8c865d21ff82902d952f91f/docutils-0.19.tar.gz
