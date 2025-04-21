kind: autotools

depends:
- public-stacks/runtime-minimal.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/texinfo.bst
  type: build

variables:
  includedir: "%{prefix}/include/%{gcc_triplet}"
  conf-local: |
    --enable-maintainer-mode \
    --disable-doc

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{prefix}/include'
        - '%{bindir}/gpg-error-config'
        - '%{bindir}/gpgrt-config'
        - '%{libdir}/libgpg-error.so'

sources:
- kind: git_repo
  url: gnupg:libgpg-error.git
  track: libgpg-error-*
  ref: libgpg-error-1.54-0-g9d47a0f1f8ae0b9aa4c2d0c230c08c8fbe243f42
