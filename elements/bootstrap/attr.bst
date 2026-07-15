# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

(@):
- elements/bootstrap/include/target.yml

build-depends:
- bootstrap/base-sdk/automake.bst
- bootstrap/base-sdk/gettext.bst
- bootstrap/base-sdk/libtool.bst
- bootstrap/build/debug-utils.bst
- bootstrap/build/gcc-stage2.bst
- filename: bootstrap/glibc.bst
  config:
    location: "%{sysroot}"

- bootstrap/gnu-config.bst

runtime-depends:
- bootstrap/glibc.bst

config:
  configure-commands:
    (<):
    - ./autogen.sh

    # po/en@*.po are generated files. They are not reproducible
    # because of PO-Revision-Date.
    - |
      mkdir tmp-build
      cd tmp-build
      ../configure %{conf-args}
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

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libattr.so'

sources:
- kind: git_repo
  url: savannah:attr.git
  track: v*
  ref: v2.6.0-0-gc440855d6b33446edf4b5eb1a2d892281f15a99b
