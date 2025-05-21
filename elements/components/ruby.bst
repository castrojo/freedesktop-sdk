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
  url: tar_https:cache.ruby-lang.org/pub/ruby/3.4/ruby-3.4.4.tar.gz
  ref: a0597bfdf312e010efd1effaa8d7f1d7833146fdc17950caa8158ffa3dcbfa85
