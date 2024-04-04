kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/sndfile.bst

variables:
  conf-local: |
    --enable-sndfile

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libsamplerate.so'

sources:
- kind: git_repo
  url: github:libsndfile/libsamplerate.git
  track: '*.*.*'
  ref: 0.2.2-0-gc96f5e3de9c4488f4e6c97f59f5245f22fda22f7
