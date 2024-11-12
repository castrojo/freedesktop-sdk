kind: filter

build-depends:
- components/systemd-base.bst

runtime-depends:
- public-stacks/runtime-minimal.bst
- components/libcap.bst
- components/libgcrypt.bst
- components/systemd-manifest.bst
- components/lz4.bst
- components/zstd.bst

config:
  include:
  - systemd-libs

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libsystemd.so'
        - '%{libdir}/libudev.so'
