kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

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
  ref: libexif-0_6_25-release-0-ge99f14785ef02ee249bccbad8a97595eadbab810
