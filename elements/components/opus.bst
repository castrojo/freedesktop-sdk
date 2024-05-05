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
  cpe:
    vendor: opus-codec

sources:
- kind: git_repo
  url: xiph:opus.git
  track: v1.4*
  ref: v1.4-0-g82ac57d9f1aaf575800cf17373348e45b7ce6c0d
