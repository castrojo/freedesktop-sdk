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
  ref: v0.8.5-0-gf5d39702622208b3ada064d7b2eaeaf1454c9bd3
