kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/bison.bst
- components/perl.bst

depends:
- public-stacks/runtime-minimal.bst
- components/e2fsprogs.bst
- components/keyutils.bst
- components/openssl.bst

variables:
  command-subdir: src

  conf-local: >-
    --runstatedir=/run
    --disable-rpath
    --with-system-et
    --with-system-ss
    --with-keyutils

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgssapi_krb5.so'
        - '%{libdir}/libgssrpc.so'
        - '%{libdir}/libk5crypto.so'
        - '%{libdir}/libkadm5clnt_mit.so'
        - '%{libdir}/libkadm5clnt.so'
        - '%{libdir}/libkadm5srv_mit.so'
        - '%{libdir}/libkadm5srv.so'
        - '%{libdir}/libkdb5.so'
        - '%{libdir}/libkrad.so'
        - '%{libdir}/libkrb5.so'
        - '%{libdir}/libkrb5support.so'
        - '%{libdir}/libverto.so'
  cpe:
    product: kerberos_5

sources:
- kind: git_repo
  url: github:krb5/krb5.git
  track: "krb5-*.*.*-final"
  ref: krb5-1.22.2-final-0-g8570e77819563e036027e1da789d08ec9333ed4d
# These fixes are not released yet.
- kind: patch
  path: patches/krb5/b7290e0cab5b7e39cd4aa7c098beb18a886d4a1d.patch
- kind: patch
  path: patches/krb5/fix-strchr-conformance-to-c23.patch
