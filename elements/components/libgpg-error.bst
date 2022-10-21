kind: autotools

depends:
- filename: bootstrap-import.bst
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
- kind: git_tag
  url: gnupg:libgpg-error.git
  track: master
  match:
  - libgpg-error-*
  ref: libgpg-error-1.46-0-gea031873aa9642831017937fd33e9009d514ee07
