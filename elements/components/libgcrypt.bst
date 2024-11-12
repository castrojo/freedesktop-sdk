kind: autotools

depends:
- public-stacks/runtime-minimal.bst
- filename: components/libgpg-error.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/texinfo.bst
  type: build

variables:
  conf-local: |
    --enable-maintainer-mode \
    --disable-doc

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/libgcrypt-config'
        - '%{libdir}/libgcrypt.so'

sources:
- kind: git_repo
  url: gnupg:libgcrypt.git
  track: libgcrypt-*
  ref: libgcrypt-1.11.0-0-g9d94d7846cde272b8b1519ba96e53967bf0b90d2
