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

variables:
  conf-local: |
    --enable-external-libs

sources:
- kind: tar
  url: github_files:libsndfile/libsndfile/releases/download/1.1.0/libsndfile-1.1.0.tar.xz
  ref: 0f98e101c0f7c850a71225fb5feaf33b106227b3d331333ddc9bacee190bcf41
