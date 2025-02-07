kind: autotools

depends:
- bootstrap-import.bst

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
  ref: v4.19.0-0-g2b7ee166f031bea63c5e7badcedc69f1cea69c89
# Update manually according to
# https://gitlab.com/gnutls/libtasn1/-/blob/TAG/bootstrap.conf?ref_type=heads#L19
- kind: git_repo
  directory: gnulib
  url: savannah:gnulib.git
  ref: c89cd2fbd3b9f3d7c5a146247256599714c91ec7
