kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/systemd.bst
- (@): include/_private/gcc-for-recc.yml

depends:
- public-stacks/runtime-minimal.bst
- components/zstd.bst

config:
  install-commands:
    (>):
    - ln -sf plocate %{install-root}%{bindir}/locate

sources:
- kind: tar
  url: tar_https:plocate.sesse.net/download/plocate-1.1.24.tar.gz
  ref: e55a757af1d7efb15ea674993224da4f0258479f8f720bd3dae0925d27dc04a2
