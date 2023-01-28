kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/doxygen.bst
- components/git-minimal.bst
- components/systemd-stage1.bst

depends:
- components/libgcrypt.bst
- components/json-c.bst
- components/curl.bst
- components/openssl.bst
- components/util-linux.bst

variables:
  conf-local: >-
    --runstatedir=/run

sources:
- kind: git_tag
  url: github:tpm2-software/tpm2-tss.git
  track: master
  track-extra:
  - 3.2.x
  exclude:
  - '*rc*'
  ref: 4.0.1-0-g8b404ee7e5886c71aa53accb4ad38823724f7b13
