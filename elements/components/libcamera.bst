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
  (?):
    - target_arch == "i686" or target_arch == "x86_64":
        arch-pipelines: ',ipu3'
    - target_arch == "aarch64" or target_arch == "arm":
        arch-pipelines: ',imx8-isi,rkisp1,rpi/vc4,simple'

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

sources:
- kind: git_repo
  url: git_https:git.libcamera.org/libcamera/libcamera.git
  track: v*.*
  ref: v0.2.0-0-g89227a428a82e724548399d35c98ea89566f9045
