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
  url: tar_https:cache.ruby-lang.org/pub/ruby/3.3/ruby-3.3.3.tar.gz
  ref: 83c05b2177ee9c335b631b29b8c077b4770166d02fa527f3a9f6a40d13f3cce2
