kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/gnupg.bst
- components/git-minimal.bst
- components/texinfo.bst

depends:
- bootstrap-import.bst
- components/libgpg-error.bst
- components/libassuan.bst

variables:
  conf-local: >-
    --enable-maintainer-mode
    --disable-glibtest
    --disable-gpgconf-test
    --disable-gpg-test
    --disable-gpgsm-test
    --disable-g13-test

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/gpgme-config'
        - '%{libdir}/libgpgme.so'
        - '%{libdir}/libgpgmepp.so'

config:
  install-commands:
    (>):
    - rm "%{install-root}/usr/share/info/dir"

    - |
      mkdir -p "%{install-root}%{includedir}/%{gcc_triplet}"
      mv "%{install-root}%{includedir}/gpgme.h" "%{install-root}%{includedir}/%{gcc_triplet}/"

sources:
- kind: git_repo
  url: gnupg:gpgme.git
  ref: gpgme-1.19.0-0-g96a30fdf30626a7cefd9c9e620a60817ef44fde2
