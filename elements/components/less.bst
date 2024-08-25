kind: autotools
description: GNU less

depends:
- bootstrap-import.bst

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
  url: ftp_gnu_org:less/less-661.tar.gz
  ref: 2b5f0167216e3ef0ffcb0c31c374e287eb035e4e223d5dae315c2783b6e738ed
