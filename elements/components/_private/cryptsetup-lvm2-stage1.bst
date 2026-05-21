kind: filter

build-depends:
- components/_private/cryptsetup-base.bst

runtime-depends:
- components/cryptsetup-manifest.bst
- components/json-c.bst
- components/pwquality.bst
# Uses libblkid and libuuid
- components/util-linux-libs.bst
- components/_private/lvm2-stage1.bst
