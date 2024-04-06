kind: autotools

depends:
- filename: bootstrap-import.bst
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
  track: v*
  ref: v1.2.7.1-0-ga92944bf60f7d577c730a2856881e1ff5cbfeb88
