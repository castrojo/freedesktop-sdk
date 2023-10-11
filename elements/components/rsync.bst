kind: autotools

depends:
- bootstrap-import.bst
- components/lz4.bst
- components/openssl.bst

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/git-minimal.bst

variables:
  conf-local: >-
    --without-included-zlib
    --disable-zstd
    --disable-simd
    --disable-md2man

config:
  (?):
  # FIXME: not needed in next release
  - target_arch == "loongarch64":
      configure-commands:
        (<):
        - |
          cp -v %{datadir}/gnu-config/config* .

(@):
- elements/include/rsync-source.yml
