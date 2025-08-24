kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/asciidoctor.bst
- components/json-c.bst
- components/pwquality.bst
- components/util-linux-full.bst
- components/lvm2-stage1.bst
- components/popt.bst
- components/openssl.bst

variables:
  meson-local: >-
    -Dpwquality=true
    -Dssh-token=false
    -Dtmpfilesdir="%{indep-libdir}/tmpfiles.d"

public:
  cpe:
    product: cryptsetup

sources:
- kind: git_repo
  url: gitlab:cryptsetup/cryptsetup.git
  track: v*
  exclude:
  - '*rc*'
  ref: v2.8.1-0-g9cfdd6ba068b375a2b6cda429b3f92388448dd67
