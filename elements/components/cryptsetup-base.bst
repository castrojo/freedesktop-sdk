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

sources:
- kind: git_tag
  url: gitlab:cryptsetup/cryptsetup.git
  track: master
  exclude:
  - '*rc*'
  ref: v2.6.0-0-gb08212ea45c524ccd30785fa937590107e275acd
