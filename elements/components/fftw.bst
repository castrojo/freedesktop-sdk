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
  url: tar_https:www.fftw.org/fftw-3.3.10.tar.gz
  ref: 56c932549852cddcfafdab3820b0200c7742675be92179e59e6215b340e26467
