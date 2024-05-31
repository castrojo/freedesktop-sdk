kind: meson

# This element is not be used directly. Use either:
#  - components/pipewire.bst
#  - components/pipewire-daemon.bst

build-depends:
- bootstrap-import.bst
- components/alsa-lib.bst
- components/avahi.bst
- components/bluez.bst
- components/bluez-libs.bst
- components/dbus.bst
- components/gstreamer-plugins-base.bst
- components/gtk-doc.bst
- components/libcamera.bst
- components/libfdk-aac.bst
- components/libusb.bst
- components/libpulse.bst
- components/libmysofa.bst
- components/patchelf.bst
- components/python3-docutils.bst
- components/rtkit.bst
- components/sbc.bst
- components/systemd-libs.bst
- components/systemd.bst
- components/vulkan-headers.bst
- components/doxygen.bst
- components/webrtc-audio-processing.bst
- public-stacks/buildsystem-meson.bst

variables:
  meson-local: >-
    -Daudiotestsrc=disabled
    -Djack=disabled
    -Droc=disabled
    -Dvideotestsrc=disabled
    -Dvolume=disabled
    -Dvulkan=disabled
    -Ddocs=enabled
    -Dman=enabled
    -Dbluez5-codec-ldac=disabled
    -Dbluez5-codec-aptx=disabled
    -Dlibcamera=enabled
    -Dpipewire-v4l2=disabled
    -Dlibcanberra=disabled
    -Dbluez5-codec-lc3=disabled
    -Dbluez5-codec-lc3plus=disabled
    -Dlv2=disabled
    -Dlibjack-path=%{libdir}
    -Djack-devel=true
    -Dudevrulesdir=$(pkg-config --variable=udevdir udev)/rules.d
    -Dsession-managers=[]
    -Dlibffado=disabled
    -Dsdl2=disabled
    -Dsnap=disabled

config:
  install-commands:
    (>):
    - |
      for module in '%{install-root}%{libdir}'/pipewire-0.3/*.so; do
        if ! objdump -x "${module}" | grep -q 'NEEDED *libpipewire-module-'; then
          patchelf --remove-rpath "${module}"
        fi
      done

public:
  bst:
    split-rules:
      daemon:
      - '%{bindir}/pipewire*'
      - '%{libdir}/libjackserver.so*'
      - '%{libdir}/spa-0.2/alsa'
      - '%{libdir}/spa-0.2/alsa/**'
      - '%{libdir}/spa-0.2/bluez5'
      - '%{libdir}/spa-0.2/bluez5/**'
      - '%{libdir}/spa-0.2/v4l2'
      - '%{libdir}/spa-0.2/v4l2/**'
      - '%{libdir}/spa-0.2/libcamera'
      - '%{libdir}/spa-0.2/libcamera/**'
      - '%{libdir}/pipewire-0.3/libpipewire-module-access.so'
      - '%{libdir}/pipewire-0.3/libpipewire-module-echo-cancel.so'
      - '%{libdir}/pipewire-0.3/libpipewire-module-filter-chain.so'
      - '%{libdir}/pipewire-0.3/libpipewire-module-link-factory.so'
      - '%{libdir}/pipewire-0.3/libpipewire-module-portal.so'
      - '%{libdir}/pipewire-0.3/libpipewire-module-profiler.so'
      - '%{libdir}/pipewire-0.3/libpipewire-module-protocol-pulse.so'
      - '%{libdir}/pipewire-0.3/libpipewire-module-protocol-simple.so'
      - '%{libdir}/pipewire-0.3/libpipewire-module-pulse-tunnel.so'
      - '%{libdir}/pipewire-0.3/libpipewire-module-raop-discover.so'
      - '%{libdir}/pipewire-0.3/libpipewire-module-spa-device.so'
      - '%{libdir}/pipewire-0.3/libpipewire-module-spa-node-factory.so'
      - '%{libdir}/pipewire-0.3/libpipewire-module-spa-node.so'
      - '%{libdir}/pipewire-0.3/libpipewire-module-zeroconf-discover.so'
      - '%{sysconfdir}/pipewire/media-session.d'
      - '%{sysconfdir}/pipewire/media-session.d/**'
      - '%{sysconfdir}/pipewire/pipewire*'
      - '%{datadir}/alsa/alsa.conf.d/99-pipewire-default.conf'
      - '%{datadir}/alsa-card-profile'
      - '%{datadir}/alsa-card-profile/**'
      - '%{indep-libdir}/systemd'
      - '%{indep-libdir}/systemd/**'
      - '%{indep-libdir}/udev'
      - '%{indep-libdir}/udev/**'
      - '%{debugdir}%{bindir}/pipewire*.debug'
      - '%{debugdir}%{libdir}/libjackserver.so*'
      - '%{debugdir}%{libdir}/spa-0.2/alsa'
      - '%{debugdir}%{libdir}/spa-0.2/alsa/**'
      - '%{debugdir}%{libdir}/spa-0.2/bluez5'
      - '%{debugdir}%{libdir}/spa-0.2/bluez5/**'
      - '%{debugdir}%{libdir}/spa-0.2/v4l2'
      - '%{debugdir}%{libdir}/spa-0.2/v4l2/**'
      - '%{debugdir}%{libdir}/spa-0.2/libcamera'
      - '%{debugdir}%{libdir}/spa-0.2/libcamera/**'
      - '%{debugdir}%{libdir}/pipewire-0.3/libpipewire-module-access.so.debug'
      - '%{debugdir}%{libdir}/pipewire-0.3/libpipewire-module-echo-cancel.so.debug'
      - '%{debugdir}%{libdir}/pipewire-0.3/libpipewire-module-filter-chain.so.debug'
      - '%{debugdir}%{libdir}/pipewire-0.3/libpipewire-module-link-factory.so.debug'
      - '%{debugdir}%{libdir}/pipewire-0.3/libpipewire-module-portal.so.debug'
      - '%{debugdir}%{libdir}/pipewire-0.3/libpipewire-module-profiler.so.debug'
      - '%{debugdir}%{libdir}/pipewire-0.3/libpipewire-module-protocol-pulse.so.debug'
      - '%{debugdir}%{libdir}/pipewire-0.3/libpipewire-module-protocol-simple.so.debug'
      - '%{debugdir}%{libdir}/pipewire-0.3/libpipewire-module-pulse-tunnel.so.debug'
      - '%{debugdir}%{libdir}/pipewire-0.3/libpipewire-module-spa-device.so.debug'
      - '%{debugdir}%{libdir}/pipewire-0.3/libpipewire-module-spa-node-factory.so.debug'
      - '%{debugdir}%{libdir}/pipewire-0.3/libpipewire-module-spa-node.so.debug'
      - '%{debugdir}%{libdir}/pipewire-0.3/libpipewire-module-zeroconf-discover.so.debug'

  cpe:
    product: pipewire

sources:
- kind: git_repo
  url: freedesktop:PipeWire/pipewire.git
  track: '*.*.*'
  exclude:
  - '*.*.9*'
  ref: 1.1.82-0-g7eeb657d37bbe1044bb5cb93d4bb6854249d092a
