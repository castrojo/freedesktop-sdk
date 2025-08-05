kind: make

build-depends:
- components/btrfs-progs.bst
- components/git-minimal.bst
- components/glib.bst
- components/go-md2man.bst
- components/go.bst
- components/ostree.bst
- components/pkg-config.bst
- public-stacks/buildsystem-make.bst

depends:
- components/containers-common.bst
- components/gpgme.bst
- components/libassuan.bst
- public-stacks/runtime-minimal.bst

environment:
  ldflags_defaults: ""
  GOPATH: "%{build-root}"

variables:
  command-subdir: src/github.com/containers/skopeo
  # otherwise it installs etc/containers/ as well
  make-install: make -j1 %{make-args} DESTDIR="%{install-root}" install-binary 
    install-docs install-completions

sources:
- kind: git_repo
  url: github:containers/skopeo.git
  directory: src/github.com/containers/skopeo
  track: v*
  exclude:
  - "*rc*"
  ref: v1.20.0-0-ge2c1eecd40b9121adf431a33cbbe60d22dc9fad7
