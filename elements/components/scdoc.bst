kind: make

build-depends:
- public-stacks/buildsystem-make.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  make-args: >-
    PREFIX="%{prefix}"
    BINDIR="%{prefix}/bin"
    MANDIR="%{mandir}"
    PCDIR="%{datadir}/pkgconfig"
    LDFLAGS="${LDFLAGS}"

sources:
- kind: git_repo
  track: '*.*.*'
  url: sourcehut:sircmpwn/scdoc
  ref: 1.11.3-0-g0528bcb993cac6c412acd3ae2e09539e994c0a59
