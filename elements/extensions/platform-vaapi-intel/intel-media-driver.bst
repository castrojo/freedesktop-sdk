kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- components/libva.bst
- extensions/platform-vaapi-intel/gmmlib.bst

environment:
  PKG_CONFIG_PATH: "%{libdir}/dri/intel-vaapi-driver/lib/pkgconfig:"

variables:
  local_flags: -D_FILE_OFFSET_BITS=64
  licensedir: "%{libdir}/dri/intel-vaapi-driver/share/licenses"
  arch-conf: ''
  (?):
  - target_arch == "i686":
      arch-conf: -DARCH:STRING=32

  cmake-local: >-
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    -DCMAKE_INSTALL_LIBDIR="%{libdir}/dri/intel-vaapi-driver/lib"
    -DLIBVA_DRIVERS_PATH="%{libdir}/dri/intel-vaapi-driver"
    -DMEDIA_BUILD_FATAL_WARNINGS=OFF
    %{arch-conf}

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/dri/intel-vaapi-driver/lib/libigfxcmrt.so"
        - "%{libdir}/dri/intel-vaapi-driver/lib/pkgconfig"
        - "%{libdir}/dri/intel-vaapi-driver/lib/pkgconfig/*"

sources:
- kind: git_repo
  url: github:intel/media-driver.git
  track: intel-media-*
  exclude:
  - intel-media-*.pre*
  - intel-media-600*
  ref: intel-media-25.3.3-0-g1bcfe56229c1163dbb4e001815d50316f1437d13
