kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends: 
- bootstrap-import.bst

variables:
  autogen: |
    libtoolize
    aclocal
    automake --add-missing --copy
    autoconf

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/libwebrtc_audio_processing.so"

sources: 
- kind: git_repo
  url: freedesktop:pulseaudio/webrtc-audio-processing.git
  # webrtc-audio-processing 1.0 and above has dramatically different API
  ref: v0.3.1-0-ge882a5442ac22c93648e12837248d651d18b9247
- kind: patch
  path: patches/webrtc-audio-processing/add-ppc-family-support.patch
- kind: patch
  path: patches/webrtc-audio-processing/riscv_support.patch
