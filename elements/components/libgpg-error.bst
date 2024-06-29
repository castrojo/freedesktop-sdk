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
- kind: git_repo
  url: gnupg:libgpg-error.git
  track: libgpg-error-*
  ref: libgpg-error-1.50-0-gbb732615daad9bba9026354ae90f0f5292ea4908
