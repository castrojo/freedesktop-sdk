kind: autotools

depends:
- bootstrap-import.bst

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/python3-docutils.bst
- components/dbus.bst
- components/systemd.bst

variables:
  build-dir: ''
  conf-local: >-
    --enable-wired
    --enable-hwsim
    --enable-tools
    --enable-ofono
    --enable-sim-hardcoded
  make: make -C iwd
  make-install: make -C iwd -j1 DESTDIR="%{install-root}" install

config:
  configure-commands:
  - |
    cd iwd
    %{autogen}
    ./%{configure}

sources:
- directory: iwd
  kind: git_repo
  url: kernel:network/wireless/iwd.git
  track: '*.*'
  ref: 2.20-0-g1ac3915641c9fc986cf71fc8de2740104da6a96a
- directory: ell
  kind: git_repo
  url: kernel:libs/ell/ell.git
  track: '*.*'
  ref: 0.68-0-g612e076222cf6685aa0e5efe1aafa13b2f6b9fac
