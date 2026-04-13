kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/perl.bst
- components/systemd.bst
- components/util-linux-full.bst

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
  ref: 2.1.11-0-g4b3e853ab468a95d8a035efa8fc4298a6c6318a3
