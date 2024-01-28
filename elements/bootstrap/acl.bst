kind: autotools

build-depends:
- bootstrap/acl-build-deps.bst

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

sources:
- kind: git_tag
  url: savannah:acl.git
  track: master
  ref: v2.3.2-0-g214c7d146945c31a9dc04cb7094b85053f52a21e
