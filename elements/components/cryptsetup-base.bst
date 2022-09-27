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
  ref: v2.5.0-0-g75111d382ba95e5038db81dbf92e9244026718d8
