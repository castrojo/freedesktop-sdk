kind: autotools

(@):
- elements/extensions/codecs-extra/config.yml

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/nasm.bst

variables:
  conf-local: >-
    --prefix="%{prefix}"
    --libdir="%{libdir}"
    --enable-pic
    --disable-cli
    --disable-bashcompletion
  make-install: make -j1 %{make-args} DESTDIR="%{install-root}" install-lib-dev install-lib-shared

sources:
- kind: git_repo
  url: videolan:x264.git
  track: stable
  ref: 31e19f92f00c7003fa115047ce50978bc98c3a0d
- kind: patch
  path: patches/libx264/ppc-incompatible-pointer-types.patch
