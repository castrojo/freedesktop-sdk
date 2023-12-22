kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libcap-ng.so'

sources:
- kind: git_tag
  url: github:stevegrubb/libcap-ng.git
  track: master
  ref: v0.8.4-0-gb1ddc6d75af7800a17836722b6a63e01217d3ffd
