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
  url: github_files:libsndfile/libsndfile/releases/download/1.2.2/libsndfile-1.2.2.tar.xz
  ref: 3799ca9924d3125038880367bf1468e53a1b7e3686a934f098b7e1d286cdb80e
- kind: patch
  path: patches/sndfile/0001-CVE-2024-50612.patch
