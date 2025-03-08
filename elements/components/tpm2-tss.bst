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
    --with-sysusersdir="$(pkg-config --variable=sysusersdir systemd)"
    --with-tmpfilesdir="$(pkg-config --variable=tmpfilesdir systemd)"
    --with-udevrulesdir="$(pkg-config --variable=udevdir udev)/rules.d"

sources:
- kind: git_repo
  url: github:tpm2-software/tpm2-tss.git
  track: '*.*.*'
  exclude:
  - '*rc*'
  ref: 4.1.3-0-g30e6057722058cb85c292dcb7b77760ad6410d4e
