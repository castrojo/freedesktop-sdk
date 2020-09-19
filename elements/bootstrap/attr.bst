kind: autotools

build-depends:
- bootstrap/base-sdk/automake.bst
- bootstrap/base-sdk/libtool.bst
- bootstrap/base-sdk/gettext.bst
- bootstrap/build/gcc-stage2.bst
- bootstrap/build/debug-utils.bst
- bootstrap/gnu-config.bst
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

    # po/en@*.po are generated files. They are not reproducible
    # because of PO-Revision-Date.
    - |
      mkdir tmp-build
      cd tmp-build
      ../configure
      cd po
      make
      cd ../..
      rm -rf tmp-build
      rm po/*.gmo
      sed -i 's/"PO-Revision-Date: .*[\]n"/"PO-Revision-Date: 2011-11-11 11:11+0000\\n"/' po/en@*.po

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
  ref: v2.5.2-0-gee80fdbc11c351fe96bc54a20c2893dde7df8845
