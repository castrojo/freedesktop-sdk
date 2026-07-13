# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools
build-depends:
- public-stacks/buildsystem-autotools.bst
- components/bison.bst
- components/_private/git-minimal.bst
- components/help2man.bst
- components/texinfo.bst
- components/patch.bst
- components/gtk-doc.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  # When using --disable-static, some useless rpaths appear
  conf-link-args: >-
    --enable-shared
  autogen: ./bootstrap --no-git --gnulib-srcdir=%{build-root}/gnulib

config:
  configure-commands:
    (<):
    - |
      set -eu
      GNULIB_REV_NEEDED=$(. %{build-root}/bootstrap.conf; echo "$GNULIB_REVISION")
      GNULIB_REV_FOUND=$(git -C gnulib rev-parse HEAD)
      if [ "$GNULIB_REV_NEEDED" != "$GNULIB_REV_FOUND" ]; then
        echo "Error: GNULIB revision mismatch!"
        echo "Needed: $GNULIB_REV_NEEDED"
        echo "Found:  $GNULIB_REV_FOUND"
        exit 1
      fi

  install-commands:
    (>):
    - rm "%{install-root}/usr/share/info/dir"
    - rm "%{install-root}%{libdir}/libtasn1.a"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libtasn1.so'

sources:
- kind: git_repo
  url: gitlab:gnutls/libtasn1.git
  track: v*
  ref: v4.21.0-0-g4c9554ea0307678abc7952ee301aa5f68aa64aad
# Update manually according to
# https://gitlab.com/gnutls/libtasn1/-/blob/TAG/bootstrap.conf?ref_type=heads#L19
- kind: git_repo
  directory: gnulib
  url: savannah:gnulib.git
  ref: e93789db7e86c51d6cb9683ea508e676a55cdefa
