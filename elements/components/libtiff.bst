kind: autotools

depends:
- bootstrap-import.bst
- components/jpeg.bst
- components/lzip.bst
- components/libwebp.bst

build-depends:
- public-stacks/buildsystem-autotools.bst

variables:
  autogen: autoreconf -fvi

config:
  install-commands:
    (>):
    - |
      mkdir -p "%{install-root}%{includedir}/%{gcc_triplet}"
      mv "%{install-root}%{includedir}/tiffconf.h" "%{install-root}%{includedir}/%{gcc_triplet}/"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libtiff.so'
        - '%{libdir}/libtiffxx.so'
  cpe:
    patches:
    - CVE-2022-2056
    - CVE-2022-2057
    - CVE-2022-2058
    - CVE-2022-2519
    - CVE-2022-2520
    - CVE-2022-2521
    - CVE-2022-2953
    - CVE-2022-34526
    - CVE-2022-3597
    - CVE-2022-3626
    - CVE-2022-3627
    - CVE-2022-3570
    - CVE-2022-3598
    - CVE-2022-3599
    - CVE-2022-3970
    - CVE-2022-48281
    - CVE-2022-4645
    - CVE-2023-30755
    - CVE-2023-3316
    - CVE-2023-3618
    - CVE-2023-40745
    - CVE-2023-41175
    - CVE-2023-0795
    - CVE-2023-0800
    - CVE-2023-2731
    - CVE-2023-3576
    - CVE-2023-26965
    ignored:
    - CVE-2022-2867
    - CVE-2022-2868
    - CVE-2022-2869
    - CVE-2023-52355
    - CVE-2023-1916
    - CVE-2023-0796
    - CVE-2023-0797
    - CVE-2023-0798
    - CVE-2023-0799
    - CVE-2023-0801
    - CVE-2023-0802
    - CVE-2023-0803
    - CVE-2023-0804

sources:
- kind: git_tag
  url: gitlab:libtiff/libtiff.git
  ref: v4.4.0-0-gb6a17e567f143fab49734a9e09e5bafeb6f97354
- kind: patch
  path: patches/libtiff/fix-the-FPE-in-tiffcrop-415-427-and-428.patch
- kind: patch
  path: patches/libtiff/CVE-2022-34526.patch
- kind: patch
  path: patches/libtiff/According-to-Richard-Nolde-https-gitlab.com-libtiff-.patch
- kind: patch
  path: patches/libtiff/tiffcrop-S-option-Make-decision-simpler.patch
- kind: patch
  path: patches/libtiff/tiffcrop-disable-incompatibility-of-Z-X-Y-z-options.patch
- kind: patch
  path: patches/libtiff/tiffcrop-subroutines-require-a-larger-buffer.patch
- kind: patch
  path: patches/libtiff/tiffcrop-subroutines-require-a-larger-buffer-change-buffersize-to-size_t.patch
- kind: patch
  path: patches/libtiff/Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIFFTAG_NUMBEROFINKS-value.patch
- kind: patch
  path: patches/libtiff/TIFFReadRGBATileExt-fix-unsigned-integer-overflow-on-strips-tiles-2-GB.patch
- kind: patch
  path: patches/libtiff/tiffcrop-Correct-simple-copy-paste-error.patch
