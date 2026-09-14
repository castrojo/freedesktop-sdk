kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libunistring.so'

sources:
- kind: anitya
  project-id: 1747
  url: ftp_gnu_org:libunistring/libunistring-{version}.tar.xz
  ref:
    version: '1.3'
    sha256sum: f245786c831d25150f3dfb4317cda1acc5e3f79a5da4ad073ddca58886569527
