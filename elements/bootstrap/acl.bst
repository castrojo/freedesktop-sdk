kind: autotools

build-depends:
- bootstrap/gnu-config.bst
- bootstrap/build/gcc-stage2.bst
- bootstrap/build/debug-utils.bst
- filename: bootstrap/attr.bst
  config:
    location: "%{sysroot}"

runtime-depends:
- bootstrap/attr.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libattr.so'
        - '%{libdir}/libacl.so'
        - '%{libexecdir}/libacl.so'

(@): elements/bootstrap/include/target.yml

variables:
  autogen: cd %{conf-root} && ./autogen.sh

config:
  configure-commands:
    (>):
    # po/en@*.po are generated files. They are not reproducible
    # because of PO-Revision-Date.
    - |
      make -C po
      sed -i 's/"PO-Revision-Date: .*[\]n"/"PO-Revision-Date: 2011-11-11 11:11+0000\\n"/' %{conf-root}/po/en@*.po

sources:
- kind: git_tag
  url: savannah:acl.git
  track: master
  ref: v2.3.1-0-g752c182706e2535fb4e482b25331177ebbddd2bb
