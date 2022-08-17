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

variables:
  autogen: cd %{build-root} && ./autogen.sh

(@): elements/bootstrap/include/target.yml

config:
  configure-commands:
    (>):
    # po/en@*.po are generated files. They are not reproducible
    # because of PO-Revision-Date.
    - |
      make -C po
      sed -i 's/"PO-Revision-Date: .*[\]n"/"PO-Revision-Date: 2011-11-11 11:11+0000\\n"/' %{build-root}/po/en@*.po

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
