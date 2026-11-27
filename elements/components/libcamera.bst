kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- components/glib.bst
- components/gstreamer.bst
- components/gstreamer-plugins-base.bst
- components/libyaml.bst
- components/libevent.bst
- components/systemd-libs.bst
- components/python3-jinja2.bst
- components/python3-pyyaml.bst
- components/python3-ply.bst

variables:
  pipelines: uvcvideo%{arch-pipelines}
  arch-pipelines: ''
  arch-conf: ''
  (?):
  - target_arch == "i686" or target_arch == "x86_64":
      arch-pipelines: ',ipu3'
  - target_arch == "aarch64":
      arch-pipelines: ',imx8-isi,rkisp1,rpi/vc4,simple'
      arch-conf: -Drpi-awb-nn=disabled

  meson-local: >-
    -Dgstreamer=enabled
    -Dpipelines=%{pipelines}
    -Dudev=enabled
    -Dv4l2=true
    -Dtracing=disabled
    -Dtest=false
    -Dlc-compliance=disabled
    -Dqcam=disabled
    -Ddocumentation=disabled
    -Dpycamera=disabled
    -Dcam-output-sdl2=disabled
    -Dipa_checksum_trusted_modules=true
    %{arch-conf}

config:
  install-commands:
    (>):
    - |
      rm -f "%{install-root}%{prefix}/lib/libyuv.a"

  strip-commands:
    (>):
    - |
      set -euo pipefail
      shopt -s nullglob

      ipa_directory="%{install-root}%{libdir}/libcamera/ipa"
      library_file="%{install-root}%{libdir}/libcamera.so"

      ipa_modules=("$ipa_directory"/*.so)

      python3 "%{build-root}/utils/ipa-embed-checksums.py" \
        "$library_file" "${ipa_modules[@]}"

sources:
- kind: git_repo
  url: git_https:git.libcamera.org/libcamera/libcamera.git
  track: v0.7.*
  ref: v0.7.2-0-g191e202178f02430b5942397c70d215cdd2056fa
- kind: patch
  path: patches/libcamera/reproducible-ipa-checksums.patch
