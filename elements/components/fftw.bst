# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  common_options: "--enable-threads --enable-openmp"
  arch_options: ''
  (?):
  - target_arch == "i686" or target_arch == "x86_64":
      arch_options: "--enable-sse2 --enable-avx"
  - target_arch == "aarch64":
      arch_options: "--enable-neon"
  - target_arch == "ppc64le":
      arch_options: "--enable-vsx"
        # Remember to add --enable-altivec when we will build the single
        # precision libraries.

  conf-local: |
    %{common_options} \
    %{arch_options}

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libfftw3.so'
        - '%{libdir}/libfftw3_omp.so'
        - '%{libdir}/libfftw3_threads.so'

sources:
- kind: tar
  url: tar_https:www.fftw.org/fftw-3.3.11.tar.gz
  ref: 5630c24cdeb33b131612f7eb4b1a9934234754f9f388ff8617458d0be6f239a1
