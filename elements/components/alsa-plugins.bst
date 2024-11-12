kind: autotools

depends:
- public-stacks/runtime-minimal.bst
- filename: components/alsa-lib.bst
- filename: components/libpulse.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

variables:
  conf-local: |
    --disable-jack \
    --enable-pulseaudio \
    --disable-samplerate \
    --disable-libav \
    --with-speex=no

config:
  install-commands:
    (>):
    - |
      mv "%{install-root}%{sysconfdir}/alsa/conf.d/99-pulseaudio-default.conf.example" "%{install-root}%{sysconfdir}/alsa/conf.d/99-pulseaudio-default.conf"

sources:
- kind: git_repo
  url: github:alsa-project/alsa-plugins.git
  track: v*.*.*
  ref: v1.2.12-0-g52574cb5ccbb8b546df2759e4b341a20332269b6
