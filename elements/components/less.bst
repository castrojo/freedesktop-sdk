kind: autotools
description: GNU less

depends:
- filename: bootstrap-import.bst

public:
  cpe:
    vendor: 'gnu'
    version-match: '\d+'

config:
  configure-commands:
    (<):
    # workaround #1649 and https://github.com/python/cpython/issues/108254
    - chmod +x configure mkinstalldirs

sources:
- kind: tar
  url: ftp_gnu_org:less/less-643.tar.gz
  ref: 2911b5432c836fa084c8a2e68f6cd6312372c026a58faaa98862731c8b6052e8
