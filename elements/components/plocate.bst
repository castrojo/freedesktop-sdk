kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
# systemd is needed to resolve unit install dir
- components/systemd.bst

depends:
- public-stacks/runtime-minimal.bst
- components/zstd.bst

config:
  install-commands:
    (>):
    - ln -sf plocate %{install-root}%{bindir}/locate

sources:
- kind: git_repo
  url: sesse:plocate
  track: refs/tags/*
  ref: 1.1.23-0-gfd7e1f0a1a3836b62438cdfce0b272e7c548e61a
