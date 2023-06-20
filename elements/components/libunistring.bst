kind: autotools

depends:
- filename: bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libunistring.so'

sources:
- kind: tar
  url: ftp_gnu_org:libunistring/libunistring-1.1.tar.xz
  ref: 827c1eb9cb6e7c738b171745dac0888aa58c5924df2e59239318383de0729b98
