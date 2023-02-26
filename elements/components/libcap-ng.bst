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
- kind: git_repo
  url: github:stevegrubb/libcap-ng.git
  track: v*
  ref: v0.8.3-0-g03b8572843b36bf071776a311c61f8d1dcfc4d53
