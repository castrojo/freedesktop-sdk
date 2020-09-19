kind: autotools

build-depends:
- bootstrap/gnu-config.bst
- bootstrap/build/gcc-stage2.bst
- bootstrap/build/debug-utils.bst
- filename: bootstrap/file.bst
  config:
    location: "%{sysroot}"

runtime-depends:
- bootstrap/file.bst


(@): elements/bootstrap/include/target.yml

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpopt.so'

sources:
- kind: tar
  url: tar_http:ftp.rpm.org/popt/releases/popt-1.x/popt-1.18.tar.gz
  ref: 5159bc03a20b28ce363aa96765f37df99ea4d8850b1ece17d1e6ad5c24fdc5d1
