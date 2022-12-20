kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

variables:
  (?):
  - target_arch == "aarch64":
        # Without it, it tries to compile arm 32 bit assembly which
        # does not work.
      conf-local: |
        --disable-neon

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libspeexdsp.so'

sources:
- kind: git_repo
  url: xiph:speexdsp.git
  track: SpeexDSP-*
  exclude:
  - SpeexDSP-*rc*
  - SpeexDSP-*beta*
  ref: SpeexDSP-1.2.1-0-g1b28a0f61bc31162979e1f26f3981fc3637095c8
