kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/asciidoctor.bst
- components/json-c.bst
- components/pwquality.bst
- components/util-linux-full.bst
- components/lvm2-stage1.bst
- components/popt.bst
- components/openssl.bst

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
  ref: v2.7.2-0-g30af820205ea986690e895ba565889c56c9530ce
