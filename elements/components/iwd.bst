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
  ref: 3.11-0-g9d9d1a8ce12da45d3ae191fc48a58306b9404b83
- directory: ell
  kind: git_repo
  url: kernel:libs/ell/ell.git
  track: '*.*'
  ref: 0.81-0-g2e254f51bd82c28f8a2132d58a960fb6b0887f79
