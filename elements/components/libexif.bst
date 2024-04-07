kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libexif.so'

  cpe:
    version-match: '(\d+)_(\d+)_(\d+)'
    vendor: 'curtis_galloway'

sources:
- kind: git_repo
  url: github:libexif/libexif.git
  track: libexif-*
  ref: libexif-0_6_24-release-0-g5bc74ae756f01bba42e73281fad67053bc7ac5f7
