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
  ref: 3.6-0-g7d5bcd738bb92cd33756985ffd2c4c67452a7f85
- directory: ell
  kind: git_repo
  url: kernel:libs/ell/ell.git
  track: '*.*'
  ref: 0.76-0-g0b7a45de521250b00a7c79b593d0d56e1e5797b5
