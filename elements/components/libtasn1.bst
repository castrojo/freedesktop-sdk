kind: autotools

depends:
- public-stacks/runtime-minimal.bst

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/bison.bst
- components/git-minimal.bst
- components/help2man.bst
- components/texinfo.bst
- components/patch.bst
- components/gtk-doc.bst

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
  ref: v4.20.0-0-g6b45b25e94ea538192cc0f97e9ad57171d1c6374
# Update manually according to
# https://gitlab.com/gnutls/libtasn1/-/blob/TAG/bootstrap.conf?ref_type=heads#L19
- kind: git_repo
  directory: gnulib
  url: savannah:gnulib.git
  ref: c89cd2fbd3b9f3d7c5a146247256599714c91ec7
