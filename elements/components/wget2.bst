kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/flex.bst
- components/gperf.bst
- components/texinfo.bst

depends:
- bootstrap-import.bst
- components/brotli.bst
- components/ca-certificates.bst
- components/gpgme.bst
- components/libidn2.bst
- components/libnghttp2.bst
- components/libpsl.bst
- components/lzip.bst
- components/openssl.bst
- components/zstd.bst

variables:
  autogen: >-
    ./bootstrap --skip-po --no-git --gnulib-srcdir=%{build-root}/gnulib
  conf-local: >-
    --disable-rpath
    --with-ssl=openssl

config:
  install-commands:
    (>):
    - rm %{install-root}%{bindir}/wget2_noinstall
    - ln -s wget2 %{install-root}%{bindir}/wget

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libwget_alloc.so'
        - '%{libdir}/libwget_common.so'
        - '%{libdir}/libwget_css.so'
        - '%{libdir}/libwget_decompress.so'
        - '%{libdir}/libwget_dnscache.so'
        - '%{libdir}/libwget_dns.so'
        - '%{libdir}/libwget_encoding.so'
        - '%{libdir}/libwget_hashfile.so'
        - '%{libdir}/libwget_hpkp_db.so'
        - '%{libdir}/libwget_hsts.so'
        - '%{libdir}/libwget_http_parse.so'
        - '%{libdir}/libwget_io.so'
        - '%{libdir}/libwget_ip.so'
        - '%{libdir}/libwget_iri.so'
        - '%{libdir}/libwget_logger.so'
        - '%{libdir}/libwget_metalink.so'
        - '%{libdir}/libwget_netrc.so'
        - '%{libdir}/libwget_ocsp.so'
        - '%{libdir}/libwget_progress.so'
        - '%{libdir}/libwget_robots.so'
        - '%{libdir}/libwget.so'
        - '%{libdir}/libwget_thread.so'
        - '%{libdir}/libwget_tls_session.so'
        - '%{libdir}/libwget_xml.so'

sources:
- kind: git_repo
  url: gitlab:gnuwget/wget2.git
  track: v2.1.*
  ref: v2.1.0-0-g657e3d22c488a2d1f173e208e253995e15f8b6db
- kind: git_module
  path: gnulib
  url: savannah:gnulib.git
  ref: 2ae6faf9c78384dc6a2674b62dd56ff153cd51f6
