kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/perl.bst
- components/systemd.bst

depends:
- components/open-isns.bst
- components/kmod.bst
- components/systemd-libs.bst

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
  ref: 2.1.9-0-g678c3e9232b2b7177b7131071910da14f065e037
