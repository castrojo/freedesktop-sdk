kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/git-minimal.bst
- components/systemd.bst     # To properly place udev rules

depends:
- bootstrap-import.bst
- components/jpeg.bst

variables:
  conf-local: |
    --with-udevdir=$(pkg-config --variable=udevdir udev)

config:
  configure-commands:
  - |
    autoreconf -ivf
  - |
    mkdir -p %{builddir}
    cd %{builddir}
    ../%{configure}

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libdvbv5.so'
        - '%{libdir}/libv4l1.so'
        - '%{libdir}/libv4l2.so'
        - '%{libdir}/libv4l2rds.so'
        - '%{libdir}/libv4lconvert.so'
        - '%{libdir}/v4l1compat.so'
        - '%{libdir}/v4l2convert.so'

sources:
- kind: git_tag
  url: git_https:git.linuxtv.org/v4l-utils.git
  track: stable-1.20
  ref: v4l-utils-1.20.0-0-g3b22ab02b960e4d1e90618e9fce9b7c8a80d814a
