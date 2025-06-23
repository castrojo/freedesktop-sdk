kind: autotools_recc

(@):
- elements/extensions/codecs-extra/config.yml

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/nasm.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

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
  ref: b35605ace3ddf7c1a5d67a2eb553f034aef41d55
