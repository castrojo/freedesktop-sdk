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

sources:
- kind: tar
  url: ftp_gnu_org:cpio/cpio-2.15.tar.bz2
  ref: 937610b97c329a1ec9268553fb780037bcfff0dcffe9725ebc4fd9c1aa9075db
