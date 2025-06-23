kind: autotools-recc

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/_private/lvm2-stage1.bst
- components/asciidoctor.bst
- components/json-c.bst
- components/openssl.bst
- components/popt.bst
- components/pwquality.bst
- components/util-linux-full.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

variables:
  conf-local: >-
    --enable-pwquality
    --disable-ssh-token
    --with-tmpfilesdir="%{indep-libdir}/tmpfiles.d"

public:
  cpe:
    product: cryptsetup

sources:
- kind: git_repo
  url: gitlab:cryptsetup/cryptsetup.git
  track: v*
  exclude:
  - '*rc*'
  ref: v2.8.4-0-gcac3dbaca79af7148281f84944b468d304f144e7
