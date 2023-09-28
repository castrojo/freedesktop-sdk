kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/perl.bst
  type: build
- filename: components/nasm.bst
  type: build

variables:
  (?):
  - target_arch == "x86_64":
      vpxtarget: x86_64-linux-gcc
  - target_arch == "i686":
      vpxtarget: x86-linux-gcc
  - target_arch == "arm":
      vpxtarget: armv7-linux-gcc
  - target_arch == "aarch64":
      vpxtarget: arm64-linux-gcc
  - target_arch == "ppc64le":
      vpxtarget: ppc64le-linux-gcc
  - target_arch == "riscv64":
      vpxtarget: generic-gnu
  - target_arch == "ppc64":
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
  ref: v1.13.0-0-gd6eb9696aa72473c1a11d34d928d35a3acc0c9a9
- kind: patch_queue
  path: patches/libvpx
