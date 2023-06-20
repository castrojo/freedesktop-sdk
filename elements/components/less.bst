kind: autotools
description: GNU less

depends:
- filename: bootstrap-import.bst

public:
  cpe:
    vendor: 'gnu'
    version-match: '\d+'

sources:
- kind: tar
  url: ftp_gnu_org:less/less-633.tar.gz
  ref: 2f201d64b828b88af36dfe6cfdba3e0819ece2e446ebe6224813209aaefed04f
