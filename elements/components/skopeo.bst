kind: make

build-depends:
- components/btrfs-progs.bst
- components/_private/git-minimal.bst
- components/glib.bst
- components/go-md2man.bst
- components/go.bst
- components/ostree.bst
- components/pkg-config.bst
- components/sed.bst
- public-stacks/buildsystem-make.bst

depends:
- components/containers-common.bst
- components/gpgme.bst
- components/libassuan.bst
- components/sqlite.bst
- public-stacks/runtime-minimal.bst

variables:
  command-subdir: src/github.com/containers/skopeo
  make-args: >-
    PREFIX="%{prefix}"
    EXTRA_LDFLAGS="%{go_ldflags}"
  make-install-args: >-
    %{make-args}
    DESTDIR="%{install-root}"
    install-binary install-docs install-completions

config:
  build-commands:
    (<):
    - sed -i 's|-gcflags "$(GOGCFLAGS)"||' Makefile

sources:
- kind: git_repo
  url: github:containers/skopeo.git
  directory: src/github.com/containers/skopeo
  track: v*
  exclude:
  - "*rc*"
  ref: v1.22.2-0-g267465e170820673de25149378284fb352daa65e
