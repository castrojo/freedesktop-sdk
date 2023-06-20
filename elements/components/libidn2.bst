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
  url: ftp_gnu_org:libidn/libidn2-2.3.4.tar.gz
  ref: 93caba72b4e051d1f8d4f5a076ab63c99b77faee019b72b9783b267986dbb45f
