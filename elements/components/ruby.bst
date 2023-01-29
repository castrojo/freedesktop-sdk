kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
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
  url: tar_https:cache.ruby-lang.org/pub/ruby/3.2/ruby-3.2.0.tar.xz
  ref: d2f4577306e6dd932259693233141e5c3ec13622c95b75996541b8d5b68b28b4
