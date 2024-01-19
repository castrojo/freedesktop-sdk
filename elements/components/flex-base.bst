kind: autotools

build-depends:
- bootstrap/bootstrap.bst
- components/autoconf.bst
- components/automake.bst
- components/gettext.bst
- components/libtool.bst
- components/help2man.bst
- components/tar.bst
- components/texinfo.bst
- components/gzip.bst

depends:
- bootstrap/bootstrap-base.bst
- components/m4.bst

config:
  configure-commands:
    (<):
    - |
      ./autogen.sh

  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

public:
  bst:
    split-rules:
      libfl:
      - '%{libdir}/libfl.so.*'
  cpe:
    product: flex

sources:
- kind: tar
  url: github_files:westes/flex/files/981163/flex-2.6.4.tar.gz
  ref: e87aae032bf07c26f85ac0ed3250998c37621d95f8bd748b31f15b33c45ee995
- kind: patch
  path: patches/flex/flex-pie.patch
