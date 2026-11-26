kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
- bootstrap/zlib.bst
- bootstrap/libxcrypt.bst
- components/libffi.bst
- components/gdbm.bst
- components/libyaml.bst
- components/openssl.bst

# Set '--with-compress-debug-sections=no' because of
# https://bugs.ruby-lang.org/issues/12934
variables:
  conf-local: >-
    --enable-pthread
    --enable-ipv6
    --with-compress-debug-sections=no
    --disable-rpath

sources:
- kind: tar
  url: tar_https:cache.ruby-lang.org/pub/ruby/4.0/ruby-4.0.10.tar.xz
  ref: 1537f7a6003c436546ecab6b48b6e7725a9af2328f45a8af7f42f41c5df90ab8
