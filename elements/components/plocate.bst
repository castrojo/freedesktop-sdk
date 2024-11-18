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
  ref: 1.1.22-0-gcc95fed7a22f464dc84950a47b26a24f70b0b216
