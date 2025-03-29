kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/libflac.bst
- components/libogg.bst
- components/libvorbis.bst
- components/opus.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libsndfile.so'
  cpe:
    product: libsndfile
    patches:
    - CVE-2024-50612

variables:
  conf-local: |
    --enable-external-libs

sources:
- kind: tar
  url: github_files:libsndfile/libsndfile/releases/download/1.2.0/libsndfile-1.2.0.tar.xz
  ref: 0e30e7072f83dc84863e2e55f299175c7e04a5902ae79cfb99d4249ee8f6d60a
- kind: patch
  path: patches/sndfile/0001-CVE-2024-50612.patch
