kind: make

build-depends:
- public-stacks/buildsystem-make.bst
- components/btrfs-progs.bst
- components/git-minimal.bst
- components/glib.bst
- components/go-md2man.bst
- components/go.bst
- components/pkg-config.bst

depends:
- public-stacks/runtime-minimal.bst
- components/bzip2.bst
- components/containers-common.bst
- components/gpgme.bst
- components/gzip.bst
- components/libassuan.bst
- components/libseccomp.bst
- components/systemd-libs.bst

runtime-depends:
- components/catatonit.bst
- components/conmon.bst
- components/crun.bst
- components/fuse-overlayfs.bst
- components/iptables.bst
- components/netavark.bst
- components/ostree.bst
- components/passt.bst
- components/slirp4netns.bst

environment:
  GOPATH: "%{build-root}"

variables:
  command-subdir: src/github.com/containers/buildah
  optimize-debug: "false"
  make-install: make -j1 %{make-install-args} DESTDIR="%{install-root}" install install.completions

sources:
- kind: git_repo
  url: github:containers/buildah.git
  directory: src/github.com/containers/buildah
  track: v*
  ref: v1.41.3-0-gb60c59c79a1900a48414d74c2a42b6a576a9c585
