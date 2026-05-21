kind: filter

build-depends:
- components/_private/cryptsetup-base.bst

runtime-depends:
- components/cryptsetup-manifest.bst
- components/json-c.bst
- components/pwquality.bst
- components/libdevmapper.bst
- components/popt.bst
# Uses libblkid and libuuid
- components/util-linux-libs.bst
