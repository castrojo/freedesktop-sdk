kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/json-c.bst
- components/pwquality.bst
- components/util-linux.bst
- components/lvm2-stage1.bst
- components/popt.bst
- components/openssl.bst

variables:
  conf-local: >-
    --enable-pwquality
    --disable-asciidoc
    --disable-ssh-token
    --with-tmpfilesdir="%{indep-libdir}/tmpfiles.d"

sources:
- kind: git_tag
  url: gitlab:cryptsetup/cryptsetup.git
  track: master
  exclude:
  - '*rc*'
  ref: v2.6.1-0-g4fc619853d39b56cc16a14108877a6802b001f3d
