kind: make

build-depends:
- public-stacks/buildsystem-make.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  make-args: >-
    prefix="%{install-root}"
    includedir="%{install-root}/%{includedir}"
    libdir="%{install-root}%{libdir}"

sources:
- kind: tar
  url: pagure_releases:libaio/libaio-0.3.113.tar.gz
  ref: 2c44d1c5fd0d43752287c9ae1eb9c023f04ef848ea8d4aafa46e9aedb678200b
