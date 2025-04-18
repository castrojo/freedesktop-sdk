kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/perl.bst
- components/nasm.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  (?):
  - target_arch == "x86_64":
      vpxtarget: x86_64-linux-gcc
  - target_arch == "i686":
      vpxtarget: x86-linux-gcc
  - target_arch == "aarch64":
      vpxtarget: arm64-linux-gcc
  - target_arch == "ppc64le":
      vpxtarget: ppc64le-linux-gcc
  - target_arch == "riscv64":
      vpxtarget: generic-gnu
  - target_arch == "ppc64":
      vpxtarget: generic-gnu
  - target_arch == "loongarch64":
      vpxtarget: generic-gnu


  conf-args: |
    --prefix="%{prefix}" \
    --libdir="%{libdir}" \
    --enable-pic \
    --enable-optimizations \
    --target="%{vpxtarget}" \
    --disable-static \
    --enable-shared \
    --enable-vp8 \
    --enable-vp9 \
    --enable-libs \
    --disable-install-docs \
    --as=nasm \
    --enable-vp9-highbitdepth

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libvpx.so'

sources:
- kind: git_repo
  url: chromium:webm/libvpx.git
  track: v*
  exclude:
  - v*rc*
  ref: v1.15.1-0-g39e8b9dcd4696d9ac3ebd4722e012488382f1adb
