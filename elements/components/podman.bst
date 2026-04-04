kind: make

build-depends:
- components/pkg-config.bst
- components/go.bst
- components/go-md2man.bst
- components/_private/git-minimal.bst
- components/python3.bst
- public-stacks/buildsystem-make.bst

depends:
- components/containers-common.bst
- components/gpgme.bst
- components/libseccomp.bst
- components/systemd-libs.bst
- public-stacks/runtime-minimal.bst

runtime-depends:
- components/catatonit.bst
- components/conmon.bst
- components/crun.bst
- components/netavark.bst
- components/passt.bst
- components/slirp4netns.bst
- components/fuse-overlayfs.bst
- components/iptables.bst

environment:
  MAKEFLAGS: -j1

variables:
  optimize-debug: "false"
  command-subdir: src/github.com/containers/podman
  make-args: >-
    PREFIX="%{prefix}"
    EXTRA_LDFLAGS="%{go_ldflags}"
  make-install-args: >-
    %{make-args}
    DESTDIR="%{install-root}"
    install install.completions

sources:
- kind: git_repo
  url: github:containers/podman.git
  directory: src/github.com/containers/podman
  track: v*
  exclude:
  - "*rc*"
  ref: v5.8.1-0-gc6077f645788743258a1a749f8005b4fb3cbe533
