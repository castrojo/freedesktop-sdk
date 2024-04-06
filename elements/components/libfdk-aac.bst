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
  url: freedesktop_people:fdk-aac.git
  track: stripped4
  ref-format: sha1
  ref: 0fc0e0e0b89de3becd5f099eae725f13eeecc0d1
