kind: autotools

build-depends:
- bootstrap/gnu-config.bst
- bootstrap/build/gcc-stage2.bst
- bootstrap/build/debug-utils.bst
- filename: bootstrap/glibc.bst
  config:
    location: "%{sysroot}"

runtime-depends:
- bootstrap/glibc.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libattr.so'

(@): elements/bootstrap/include/target.yml

config:
  configure-commands:
    (<):
    - ./autogen.sh

  install-commands:
    (>):
# Man pages will be provided by Linux's man-pages
# sdk/elements/base/man-pages.bst
    - |
      rm -rf "%{install-root}%{mandir}"

sources:
- kind: git_tag
  url: savannah:attr.git
  track: master
  ref: v2.5.1-0-gfb7e6bacbd9c7b1b9c452b7356a3d5e5a6163366
