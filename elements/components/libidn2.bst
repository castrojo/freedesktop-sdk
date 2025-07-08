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
  url: ftp_gnu_org:libidn/libidn2-2.3.8.tar.gz
  ref: f557911bf6171621e1f72ff35f5b1825bb35b52ed45325dcdee931e5d3c0787a
