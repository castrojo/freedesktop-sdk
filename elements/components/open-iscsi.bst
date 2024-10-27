kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/perl.bst
- components/systemd.bst

depends:
- components/open-isns.bst
- components/kmod.bst
- components/systemd-libs.bst

environment:
  KBUILD_BUILD_TIMESTAMP: 'Thu Nov 10 15:00:00 UTC 2011'

variables:
  meson-local: >-
    -Discsi_sbindir="%{sbindir}"

config:
  install-commands:
    (>):
    - |
      rm %{install-root}%{sysconfdir}/iscsi/initiatorname.iscsi

sources:
- kind: git_repo
  url: github:open-iscsi/open-iscsi.git
  track: '*.*.*'
  ref: 2.1.10-0-gd0f04ae4b9bf0bc0be55fbda5f235afdfbf5dd19
