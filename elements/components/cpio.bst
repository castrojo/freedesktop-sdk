kind: autotools

depends:
- bootstrap-import.bst
- components/tar.bst

variables:
  conf-local: >-
    --with-rmt="%{libexecdir}/rmt"

config:
  install-commands:
    (>):
    # man8 is empty and this causes issue with compose element.
    - rm -rf "%{install-root}%{mandir}/man8"

public:
  cpe:
    ignored:
    - CVE-2010-4226

sources:
- kind: tar
  url: ftp_gnu_org:cpio/cpio-2.14.tar.bz2
  ref: fcdc15d60f7267a6fc7efcd6b9db7b6c8966c4f2fbbb964c24d41336fd3f2c12
