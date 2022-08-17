kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/libffi.bst
- components/gdbm.bst
- components/openssl.bst

# Set '--with-compress-debug-sections=no' because of
# https://bugs.ruby-lang.org/issues/12934
variables:
  conf-local: >-
    --enable-pthread
    --enable-ipv6
    --with-compress-debug-sections=no
    --disable-rpath
  ruby-arch: "%{arch}"
  (?):
  - target_arch in ("ppc64le", "ppc64"):
      ruby-arch: "powerpc64"

sources:
- kind: tar
  url: tar_https:cache.ruby-lang.org/pub/ruby/3.1/ruby-3.1.2.tar.xz
  ref: ca10d017f8a1b6d247556622c841fc56b90c03b1803f87198da1e4fd3ec3bf2a

config:
  install-commands:
    # Workaround binary extensions installation issues.
    # https://bugs.ruby-lang.org/issues/18373
    (<):
    - |
      find .bundle -name extconf.rb -exec \
      sed -i \
      -e '/create_makefile/i \$arch_hdrdir = "%{build-root}/%{command-subdir}/.ext/include/%{ruby-arch}-linux"' \
      -e '/create_makefile/i \$DLDFLAGS << " -L%{build-root}/%{command-subdir}"' {} \;
