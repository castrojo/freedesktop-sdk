kind: autotools

build-depends:
- bootstrap/gnu-config.bst
- bootstrap/build/gcc-stage2.bst
- bootstrap/build/debug-utils.bst
- filename: bootstrap/attr.bst
  config:
    location: "%{sysroot}"

runtime-depends:
- bootstrap/attr.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libattr.so'
        - '%{libdir}/libacl.so'
        - '%{libexecdir}/libacl.so'

(@): elements/bootstrap/include/target.yml

config:
  configure-commands:
    (<):
      - ./autogen.sh

sources:
- kind: git_tag
  url: savannah:acl.git
  track: master
  ref: v2.2.53-0-g65ff056ac4c25141cc06e484bce040635e4abd3d
