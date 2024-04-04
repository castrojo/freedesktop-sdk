kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/libogg.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libvorbis.so'
        - '%{libdir}/libvorbisfile.so'
        - '%{libdir}/libvorbisenc.so'

sources:
- kind: git_repo
  url: github:xiph/vorbis.git
  track: v*
  ref: v1.3.7-0-g0657aee69dec8508a0011f47f3b69d7538e9d262
