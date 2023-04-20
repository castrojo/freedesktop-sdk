kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/git-minimal.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libopus.so'

sources:
- kind: git_tag
  url: xiph:opus.git
  track: master
  ref: v1.4-0-g82ac57d9f1aaf575800cf17373348e45b7ce6c0d
