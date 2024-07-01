kind: autotools

depends:
- filename: bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libidn2.so'

sources:
- kind: tar
  url: ftp_gnu_org:libidn/libidn2-2.3.7.tar.gz
  ref: 4c21a791b610b9519b9d0e12b8097bf2f359b12f8dd92647611a929e6bfd7d64
