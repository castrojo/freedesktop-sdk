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
- kind: git_repo
  directory: iwd
  url: kernel:network/wireless/iwd.git
  track: '*.*'
  ref: 2.17-0-g468cecdbcaa870b2090d3598286c686c805615a0
- kind: git_repo
  directory: ell
  url: kernel:libs/ell/ell.git
  track: '*.*'
  ref: 0.64-0-gd8eaabc0c346a93543ba51f9ee6d5e8dd37ac5de
