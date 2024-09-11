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
  ref: 2.21-0-g87a8884f2530ffff75d253e83353b76d779ac843
- kind: git_repo
  directory: ell
  url: kernel:libs/ell/ell.git
  track: '*.*'
  ref: 0.69-0-g7bed251f8020ef896043f008276f41cd13fdd43f
