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
- components/gnutls.bst
- components/gpgme.bst
- components/libidn2.bst
- components/libnghttp2.bst
- components/libpsl.bst
- components/lzip.bst
- components/zstd.bst

variables:
  autogen: >-
    ./bootstrap --skip-po --no-git --gnulib-srcdir=%{build-root}/gnulib
  conf-local: >-
    --disable-rpath

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
  track: v2.0.*
  ref: v2.0.1-0-g3d25515253c26f0510a1a10882a668ca81fcc4d6
- kind: git_module
  path: gnulib
  url: savannah:gnulib.git
  ref: a88d5ed6bd16d702896a4a5367d7320020cb8988
