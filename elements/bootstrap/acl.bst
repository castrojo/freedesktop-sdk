# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

(@):
- elements/bootstrap/include/target.yml

build-depends:
- filename: bootstrap/attr.bst
  config:
    location: "%{sysroot}"

- bootstrap/base-sdk/automake.bst
- bootstrap/base-sdk/gettext.bst
- bootstrap/base-sdk/libtool.bst
- bootstrap/build/debug-utils.bst
- bootstrap/build/gcc-stage2.bst
- bootstrap/gnu-config.bst

runtime-depends:
- bootstrap/attr.bst

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

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libattr.so'
        - '%{libdir}/libacl.so'
        - '%{libexecdir}/libacl.so'

sources:
- kind: git_repo
  url: savannah:acl.git
  track: v*
  ref: v2.4.0-0-g3589787cd589b34bdd9265936e17190b6d3f17d1
