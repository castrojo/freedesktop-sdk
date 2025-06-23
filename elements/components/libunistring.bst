kind: autotools-recc

build-depends:
- public-stacks/buildsystem-autotools.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

depends:
- public-stacks/runtime-minimal.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libunistring.so'

sources:
- kind: tar
  url: ftp_gnu_org:libunistring/libunistring-1.3.tar.xz
  ref: f245786c831d25150f3dfb4317cda1acc5e3f79a5da4ad073ddca58886569527
