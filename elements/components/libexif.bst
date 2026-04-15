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
  ref: libexif-0_6_26-release-0-gb2edc5a8adf4d1b79ce9413a9c9d8f3ab871c082
