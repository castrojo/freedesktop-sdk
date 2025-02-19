kind: meson

(@):
- elements/include/gstreamer-plugins-ugly.yml
- elements/extensions/codecs-extra/config.yml

depends:
  (>):
  - extensions/codecs-extra/libx264.bst

environment:
  PKG_CONFIG_PATH: "%{libdir}/pkgconfig"

config:
  install-commands:
  - |
    install -Dm0644 "%{build-dir}/ext/x264/libgstx264.so" "%{install-root}%{libdir}/gstreamer-1.0/libgstx264.so"
    install -Dm0644 "ext/x264/GstX264Enc.prs" "%{install-root}%{prefix}/share/gstreamer-1.0/presets/GstX264Enc.prs"

variables:
  meson-extra: >-
    -Dgpl=enabled
    -Dx264=enabled
