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
        - '%{libdir}/libfdk-aac.so'

sources:
- kind: git_repo
  url: freedesktop:wtaymans/fdk-aac-stripped
  track: stripped4
  ref: 0fc0e0e0b89de3becd5f099eae725f13eeecc0d1
