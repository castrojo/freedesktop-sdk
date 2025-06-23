kind: autotools_recc

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/texinfo.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

depends:
- public-stacks/runtime-minimal.bst

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
  url: github:gpg/libgpg-error.git
  track: libgpg-error-*
  ref: libgpg-error-1.59-0-g3debf5485c4de18f0154ffd80726bc54e6e28a46
